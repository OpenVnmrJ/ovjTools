#!/bin/bash
#
# Copyright (C) 2016  Michael Tesch
#
# This file is a part of the OpenVnmrJ project.  You may distribute it
# under the terms of either the GNU General Public License or the
# Apache 2.0 License, as specified in the LICENSE file.
#
# For more information, see the OpenVnmrJ LICENSE file.
#

#
# build OVJ locally in a virtual machine
#

CMDLINE="$0 $*"
SCRIPT=$(basename "$0")
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ERRCOUNT=0
onerror() {
    echo "$(tput setaf 1)$SCRIPT: Error on line ${BASH_LINENO[0]}, exiting.$(tput sgr0)"
    if [ -t 3 ]; then
        echo "$(tput setaf 1)$SCRIPT: Error on line ${BASH_LINENO[0]}, exiting.$(tput sgr0)" >&3
        exec 1>&3 2>&4
    fi
    exit 1
}
trap onerror ERR

DATESTRING="$(date +"%Y%m%d_%H%M%S")"
TARGETS=
ACTIONS=
: "${OVJ_FRESHSRC=no}"
: "${OVJ_GITBRANCH=master}"
: "${OVJT_GITBRANCH=master}"
: "${OVJ_DEVELOPER=OpenVnmrJ}"
: "${OVJ_VMNCPU=3}"
: "${VERBOSE=3}"
: "${OVJ_LOGFILE=build_vm-${DATESTRING}.log}"
: "${OVJ_KEEPRUN=no}"
: "${OVJ_KEEPBOX=no}"
: "${OVJ_BR_FLAGS="--srcreset"}"
: "${OVJ_TI_FLAGS="-f -v"}"

# set OVJ_TOOLS if necessary
if [ "x${OVJ_TOOLS}" = "x" ] ; then
    if [ -d "$SCRIPTDIR/../vms/box_defs" ]; then
        cd "$SCRIPTDIR/../"
        OVJ_TOOLS="$(pwd)"
        echo "Setting OVJ_TOOLS to '${OVJ_TOOLS}'"
        export OVJ_TOOLS
    elif [ -d "$(pwd)/vms/box_defs" ]; then
        OVJ_TOOLS="$(pwd)"
        echo "Setting OVJ_TOOLS to '${OVJ_TOOLS}'"
        export OVJ_TOOLS
    else
        echo "set OVJ_TOOLS environment variable to the ovjTools directory"
        exit 1
    fi
fi

function usage_msg {
    cat <<EOF
usage:
  $SCRIPT <targets...> [action] [options...]

targets:
  <centos6|centos7|macos10.10|ubuntu14|ubuntu16|...>

actions:
  build                  - build OpenVnmrJ on the specified platform,
                           building any necessary VM images on the way (default).
  package                - make OpenVnmrJ packages (rpm/deb) for the OS
  install                - install OpenVnmrJ on the target VM
  test                   - test OpenVnmrJ on the target VM using vjqa
  uninstall              - uninstall OpenVnmrJ on the target VM
  clean                  - destroy all VMs used for given platform
  distclean              - destroy all VMs and all box templates

options:
  -f|--freshsrc          - remove build dir, clone fresh repos [${OVJ_FRESHSRC}]
  -k|--keeprunning       - leave the VM running after building [${OVJ_KEEPRUN}]
  --keepbox              - save the VM 'box' after building it [${OVJ_KEEPBOX}]
  -b|--branch branch     - branch to build [${OVJ_GITBRANCH}]
  -u|--gitname developer - github account name to build [${OVJ_DEVELOPER}]
  --tbranch branch_name  - branch to clone for ovjTools [${OVJT_GITBRANCH}]
  -B|--brflags           - flags to pass to build_release.sh [${OVJ_BR_FLAGS}]
  -F|--tiflags           - flags to pass to test_install.sh [${OVJ_TI_FLAGS}]
  -N|--ncpu              - how many cpus to give to each VM [${OVJ_VMNCPU}]
  -v|--verbose           - be more verbose (can add multiple times)
  -q|--quiet             - be more quiet   (can add multiple times)
  -h|--help              - print this message and exit

Environment Variables:
OVJ_TOOLS     -> path to ovjTools, VM will be in \$OVJ_TOOLS/vms/<os>/
EOF
}

function usage {
    usage_msg
    if [ -t 3 ]; then usage_msg >&3 ; fi
    exit 1
}

#######################################################################
#
# process flag args
#
while [ $# -gt 0 ]; do
    key="$1"
    case $key in
        -f|--freshsrc)          OVJ_FRESHSRC=yes              ;;
        -k|--keeprunning)       OVJ_KEEPRUN=yes               ;;
        --keepbox)              OVJ_KEEPBOX=yes               ;;
        -u|--gitname)           OVJ_DEVELOPER="$2"; shift     ;;
        -b|--branch)            OVJ_GITBRANCH="$2"; shift     ;;
        --tbranch)              OVJT_GITBRANCH="$2"; shift    ;;
        -B|--brflags)           OVJ_BR_FLAGS="$2"; shift      ;;
        -F|--tiflags)           OVJ_TI_FLAGS="$2"; shift      ;;
        -N|--ncpu)              OVJ_VMNCPU="$2"; shift      ;;
        -h|--help)              usage                         ;;
        -v|--verbose)           VERBOSE=$(( VERBOSE + 1 )) ;;
        -q|--quiet)             VERBOSE=$(( VERBOSE - 1 )) ;;
        all)
            TARGETS="centos6 centos7 ubuntu14 ubuntu16 "
            ;;
        build|package|install|test|uninstall|clean|distclean)
            ACTIONS="${ACTIONS} $key"
            ;;
        *)
            if [ -f "${OVJ_TOOLS}/vms/$key/Vagrantfile" ]; then
                TARGETS="$TARGETS $key"
            else
                # unknown option
                echo "missing ${OVJ_TOOLS}/vms/$key/Vagrantfile"
                echo "unrecognized arg: $key"
                usage
            fi
            ;;
    esac
    shift
done

if [ ${VERBOSE} -gt 4 ]; then
    set -x
fi

#######################################################################
#
# helper functions
#

# import logging functions
# shellcheck source=loglib.sh
. "$SCRIPTDIR/loglib.sh"

vrun () {
    #
    # Run a command on the VM, spin a wheelie while it's running
    #
    # only call this after `vagrant ssh-config` has initialized 'vagrant ssh'
    VCMD="$*"
    local start=$SECONDS
    local retval
    echo "${magenta}${TARGET}\$ $VCMD${normal}"
    if [ $VERBOSE -le 3 ] && [ -t 3 ]; then
        echo "${magenta}${TARGET}\$ $VCMD${normal}" >&3
    fi
    # spinner
    local sp='/-\|'
    if [ -t 3 ]; then printf ' ' >&3 ; fi
    while : ; do
        sleep 1;
        sp=${sp#?}${sp%???}
        if [ -t 3 ]; then printf '\b%.1s' "$sp" >&3 ; fi
    done &
    SPINNER_PID=$!
    # Kill the spinner if we die prematurely
    trap "kill $SPINNER_PID" EXIT
    # run command in VM
    vagrant ssh -c "$VCMD"
    retval=$?
    # Kill the spinner loop and unset the EXIT trap
    kill -PIPE $SPINNER_PID
    if [ -t 3 ]; then printf '\b.' >&3 ; fi
    trap " " EXIT
    local dur
    dur=$(TZ=UTC0 printf '%(%H:%M:%S)T\n' "$(( SECONDS - start ))")
    if [ $retval = 0 ]; then
        echo "${magenta}OK $dur${normal}"
        if [ $VERBOSE -le 3 ] && [ -t 3 ]; then
            echo "${magenta}OK$ $dur${normal}" >&3
        fi
    else
        if [ -t 3 ]; then echo "${white}${bold}FAILED=$retval $dur${normal}" >&3 ; fi
        echo "${white}${bold}FAILED=$retval $dur${normal}"
    fi
    return $retval
}

#######################################################################
#
# functions
#

clean_target() {
    local TARGET_OS="$1"
    log_info "Cleaning vms/${TARGET_OS}"
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?
    cmdspin vagrant destroy -f
}

distclean_target() {
    local TARGET_OS="$1"
    local BOXNAME

    log_info "distcleaning vms/box_defs/${TARGET_OS}"
    if ! cd "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}" ; then
        log_warn "target box def for '${TARGET_OS}' missing"
        return 1
    fi
    log_cmd rm -f package.box
    vagrant destroy -f
    # check if this box def already exists, if so just print message and exit
    BOXNAME="OpenVnmrJ/${TARGET_OS}"
    if vagrant box list | grep -q "$BOXNAME" ; then
        log_info "removing box '$BOXNAME'"
        vagrant box remove "$BOXNAME"
        retval=$?
        if [ $retval != 0 ]; then
            log_warn "box remove '${TARGET_OS}' failed, ignoring.."
        fi
        return $retval
    else
        log_info "didn't find existing box '$BOXNAME' for removal"
    fi
}

# validate requested developer/branch
validate_repo() {
    log_info "validating repositories for OpenVnmrJ and ovjTools..."

    if [ "x${OVJ_GITBRANCH}" = "x" ] ; then
        log_error "INVALID branch '${OVJ_GITBRANCH}'"
        exit 1
    fi
    # check that its a valid branch name
    if ! git ls-remote -q --exit-code "http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ" \
         "${OVJ_GITBRANCH}" > /dev/null 2>&1
    then
        log_error "INVALID branch '${OVJ_GITBRANCH}' for http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ"
        exit 1
    fi
    log_info "http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ branch=${OVJ_GITBRANCH} valid"
    if ! git ls-remote -q --exit-code "http://github.com/${OVJ_DEVELOPER}/ovjTools" \
         "${OVJT_GITBRANCH}" > /dev/null 2>&1
    then
        log_error "INVALID branch '${OVJ_GITBRANCH}' for http://github.com/${OVJ_DEVELOPER}/ovjTools"
        exit 1
    fi
    log_info "http://github.com/${OVJ_DEVELOPER}/ovjTool branch=${OVJT_GITBRANCH} is valid"
}

# build a vagrant "box" for a particular OS
build_box() {
    local TARGET_OS="$1"
    local BOXNAME

    # the vagrant boxname
    BOXNAME="OpenVnmrJ/$TARGET_OS"

    # check if this box def already exists, if so just print message and return
    if vagrant box list | grep -q "$BOXNAME" ; then
        log_info "Found existing vagrant box '$BOXNAME'"
        return 0
    else
        log_info "Creating vagrant box '$BOXNAME' from ${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}"
    fi

    # cd to Vagrant box_def dir, 
    cd "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}" || return $?

    # check if jdk for macos is available (no way to download it automatically)
    if [[ "${TARGET_OS}" == macos* ]]; then
        JAVA_DMG=(jdk-8u*-macosx-x64.dmg)
        if [ ! -f "${JAVA_DMG}" ]; then
            log_error "Please download the macOS java SDK (${JAVA_DMG}) and place it in $(pwd) before running this."
            log_error " maybe from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"
            exit -1
        fi
    fi

    # make sure no old package file laying around
    if [ -f package.box ]; then
        echo "removing old Vagrant package.box file"
        log_cmd rm -f package.box
    fi

    # update any out-of-date vagrant boxes
    cmdspin vagrant box update

    # build and setup the VM
    log_info "Creating the box VM '$BOXNAME'"
    cmdspin vagrant up || return $?
    vagrant ssh-config > ./vagrant.ssh.config || return $?

    # setup environment in the VM
    case "${TARGET_OS}" in
        centos*|ubuntu18|fedora*)
            vagrant ssh -c 'echo "alias more=less" >> ~/.bashrc'
            ;;
        *)
            vagrant ssh -c 'echo "alias more=less" >> ~/.profile'
            ;;
    esac

    # setup java sdk on macos
    if [[ "${TARGET_OS}" == macos* ]]; then
        log_info "Installing java package '${JAVA_DMG}' for macos"
        log_cmd scp -F vagrant.ssh.config "${JAVA_DMG}" default: || return $?
        #log_cmd sshpass -p vagrant scp -P 2222 "${JAVA_DMG}" vagrant@127.0.0.1: || return $?
        vrun "sudo hdiutil attach ${JAVA_DMG}" || return $?
        vrun 'sudo installer -pkg /Volumes/JDK*/JDK*.pkg -target /' || return $?
        #vagrant ssh -c "sudo rm ${JAVA_DMG}"
    fi

    # boot-cycle the box, down-up-down, to make sure it boots ok
    cmdspin vagrant reload || return $?

    # halt, package, and name the box
    cmdspin vagrant halt
    cmdspin vagrant package || return $?

    # add it to local vagrant box library
    cmdspin vagrant box add "$BOXNAME" package.box || return $?

    # free up the space
    log_info "done.  removing package.box and destroy the vagrant box $BOXNAME ."
    if [ ${OVJ_KEEPBOX} = no ]; then
        log_cmd rm package.box
        log_cmd vagrant destroy -f
    fi
}

setup_target() {
    local TARGET_OS="$1"
    #
    # Setup a VM environment for the TARGET_OS, using a pre-made box,
    # if one is defined in ${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}, OR,
    # if just a Vagrantfile exists in ${OVJ_TOOLS}/vms/${TARGET_OS},
    # then just use that.
    #

    log_info "Setting up target '${TARGET_OS}'..."

    # make sure the local dev box template is setup
    if [ -d "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}" ]; then
        build_box "${TARGET_OS}" || return $?
        # "${OVJ_TOOLS}/bin/build_box.sh" "${TARGET_OS}" || return $?
    fi

    # cd to dir containing TARGET_OS's Vagrantfile, fire-up the VM
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?
    if [ ${OVJ_KEEPRUN} = no ]; then
        cmdspin vagrant halt
    fi
    log_info "Spinning up build VM in $(pwd)"
    VMNCPU=${OVJ_VMNCPU} cmdspin vagrant up || return $?
    vagrant ssh-config > ./vagrant.ssh.config || return $?

    # setup environment in the VM
    case "${TARGET_OS}" in
        centos*|fedora*)
            vrun 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.bashrc'
            vrun 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.bashrc'
            ;;
        ubuntu*)
            vrun 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'
            vrun 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
            ;;
        macos*)
            # case-sensitive filesystem at /Volumes/Vagrant1/
            vrun 'echo "export ovjBuildDir=/Volumes/Vagrant1/ovjbuild" >> ~/.profile'
            vrun 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
            #scp -F vagrant.ssh.config "Test Developer.cer" default:
            #vrun "sudo security -v add-trusted-cert -d -r trustRoot -p codeSign -k /Library/Keychains/System.keychain 'Test Developer.cer'"
            #vrun "security find-identity -p codesigning"
            ;;
        *)
            log_error "Unknown target os '${TARGET_OS}'"
    esac

    # check if setting OVJ_TOOLS in the environment works
    vrun 'echo ovjBuildDir=$ovjBuildDir'
    vrun 'echo OVJ_TOOLS=$OVJ_TOOLS'
    vrun 'scons -v'
    return $?
}

shutdown_target() {
    local TARGET_OS="$1"

    if [ ${OVJ_KEEPRUN} = no ]; then
        log_info "Shutting down '${TARGET_OS}' VM"
        vagrant halt
    else
        log_info "Left '${TARGET_OS}' VM running at '${OVJ_TOOLS}/vms/${TARGET_OS}'"
    fi
}

build_target() {
    local TARGET_OS="$1"
    local retval=0

    log_info "Building target VM '${TARGET_OS}'..."

    # cd to Vagrant dir
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?

    # check if setting OVJ_TOOLS in the environment works
    vrun 'echo OVJ_TOOLS=$OVJ_TOOLS'

    # clean existing source if requested
    if [ "$OVJ_FRESHSRC" = yes ]; then
        log_info "Forcing clean checkout and build [OVJ_FRESHSRC]"
        vrun "sudo rm -rf \$ovjBuildDir" || return $?
    fi

    # make the build dir
    #vrun 'if [ -d ${ovjBuildDir} ]; then echo "removing build dir"; rm -rf ${ovjBuildDir} ; fi '
    vrun 'mkdir -p ${ovjBuildDir}' || return $?

    # checkout the sources within the VM
    if ! vrun "cd \$ovjBuildDir/OpenVnmrJ"; then
        log_info "checking out OpenVnmrJ 'http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git' b=${OVJ_GITBRANCH}"
        vrun "cd \$ovjBuildDir && pwd"
        vrun "cd \$ovjBuildDir && git clone --depth 1 --branch ${OVJ_GITBRANCH} http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git"
    else
        # make sure that 'origin' points at right git remote
        vrun "cd \$ovjBuildDir/OpenVnmrJ && git remote set-url origin http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git"
        vrun "cd \$ovjBuildDir/OpenVnmrJ && git fetch --depth 1 origin ${OVJ_GITBRANCH}:${OVJ_GITBRANCH}"
    fi
    if ! vrun "cd \$ovjBuildDir/ovjTools"; then
        log_info "checking out ovjTools 'http://github.com/${OVJ_DEVELOPER}/ovjTools.git' b=${OVJT_GITBRANCH}"
        vrun "cd \$ovjBuildDir && git clone --depth 1 --branch ${OVJT_GITBRANCH} http://github.com/${OVJ_DEVELOPER}/ovjTools.git"
        # this might be unnecessary?
        #vrun 'cd ${ovjBuildDir} &&cp -r ovjTools/bin . '
    else
        # make sure that 'origin' points at right git remote
        vrun "cd \$ovjBuildDir/ovjTools && git remote set-url origin http://github.com/${OVJ_DEVELOPER}/ovjTools.git"
        vrun "cd \$ovjBuildDir/ovjTools && git fetch --depth 1 origin ${OVJT_GITBRANCH}:${OVJT_GITBRANCH}"
    fi

    # verify that the checkout worked
    vrun 'ls $OVJ_TOOLS' || return $?
    vrun "cd \$ovjBuildDir/OpenVnmrJ && git branch"
    vrun "cd \$ovjBuildDir/OpenVnmrJ && git checkout "

    #
    # build & package OpenVnmrJ!
    #
    #scp -F vagrant.ssh.config "${OVJ_TOOLS}/bin/build_release.sh" default:
    #BUILD_CMD="./build_release.sh package"
    # the -v here doubles the total log output size, but makes it available in our log file
    BUILD_CMD="\$ovjBuildDir/OpenVnmrJ/scripts/build_release.sh -v checkout build package ${OVJ_BR_FLAGS}"
    BUILD_CMD="${BUILD_CMD} --gitname ${OVJ_DEVELOPER} --branch ${OVJ_GITBRANCH} --tbranch ${OVJT_GITBRANCH}"

    log_info "running 'checkout build package' on VM ${TARGET_OS}"
    time vrun "${BUILD_CMD}"

    retval=$?
    if [ $retval = 0 ]; then
        # capture a list of what was built in our LOGFILE
        log_info "RET: $retval"
    else
        retval=$?
        log_warn "RET: $retval"
    fi

    vrun '${ovjBuildDir}/ovjTools/bin/whatsin $(ls -t ${ovjBuildDir}/logs/build* | head -1) | tail -60'
    vrun 'ls -l ${ovjBuildDir}/dvd*'

    case "${TARGET_OS}" in
        centos*|fedora*)
            # the install script su's to vnmr1, so these need to be
            # read/exec by vnmr1
            vrun 'chmod a+xr ${ovjBuildDir}/..'
            vrun 'chmod a+xr ${ovjBuildDir}'
            vrun 'chmod a+xr ${ovjBuildDir}/dvdimageOVJ*' || return $?
            ;;
    esac

    # build done, shutdown the VM, print status
    if [ $retval = 0 ]; then
        log_msg "Build '${TARGET_OS}' success."
    else
        log_error "Build '${TARGET_OS}' failed.  Vagrant VM at ${OVJ_TOOLS}/vms/${TARGET_OS}"
    fi

    return $retval
}

package_rpm() {
    local TARGET_OS=$1
    local COMMIT

    # this is obviously unfinished...
    log_info "Building RPM for '${TARGET_OS}'..."

    log_info "Checking source http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ ${OVJ_GITBRANCH}"
    COMMIT=$(git ls-remote --exit-code "http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ" "${OVJ_GITBRANCH}" | cut -c 1-40)
    log_info "Found git hash: $COMMIT"

    vrun 'sudo yum -y install rpm-build rpm-devel rpmlint rpmdevtools'
    vrun 'rpmdev-setuptree'

    log_cmd scp -F vagrant.ssh.config "${OVJ_TOOLS}/OpenVnmrJ.spec" default:

    vrun "sed -i -e 's/COMMIT-HASH/${COMMIT}/' OpenVnmrJ.spec"
    vrun 'sudo yum -y builddep OpenVnmrJ.spec'
    vrun 'rpmbuild -vv -ba OpenVnmrJ.spec'

}

package_target() {
    local TARGET_OS=$1
    case "${TARGET_OS}" in
        centos*|fedora*)
            package_rpm "$TARGET_OS" || return $?
            ;;
        ubuntu*|debian*)
            log_error "Debian .deb packaging unfinished"
            #package_deb "$TARGET_OS" || return $?
            ;;
        *)
            log_error "Dont know how to package '${TARGET_OS}'"
            ;;
    esac
}

install_target() {
    local TARGET_OS=$1
    local COMMAND=$2

    log_info "'${COMMAND}'ing target '${TARGET_OS}'..."

    # cd to Vagrant dir
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?

    # copy the install/test script with override, if we have one 
    if [ -f "${SCRIPTDIR}/install_test.sh" ]; then
        log_warn "Overriding target OpenVnmrJ's install_test.sh with our version."
        log_cmd scp -F vagrant.ssh.config "${SCRIPTDIR}/install_test.sh" default: || return $?
        vrun 'mv install_test.sh $ovjBuildDir/OpenVnmrJ/scripts/' || return $?
    fi

    # get rid of any existing vjqa logs
    if [ "$COMMAND" = test ]; then
        vrun 'sudo rm -f ~vnmr1/vnmrsys/ovj_qa/ovjtest/reports/20*'
    fi

    # run the remote part
    time vrun "cd \"\${OVJ_TOOLS}\" && sudo \$ovjBuildDir/OpenVnmrJ/scripts/install_test.sh ${OVJ_TI_FLAGS} $COMMAND"
    retval=$?

    if [ "$COMMAND" = test ]; then
        # if testing, copy test results back to OVJ_TOOLS dir
        local retval2
        log_cmd scp -F vagrant.ssh.config \
                default:~vnmr1/vnmrsys/ovj_qa/ovjtest/reports/report.txt \
                "${OVJ_TOOLS}/vjqa-${TARGET_OS}-${DATESTRING}.txt"
        retval2=$?
        if [ $retval2 -ne 0 ]; then
            log_error "Unable to fetch VJQA test result 'report.txt' from VM"
        fi
    fi

    # test done, shutdown the VM, print status
    if [ $retval = 0 ]; then
        log_msg "'$COMMAND' '${TARGET_OS}' success."
    else
        log_error "'$COMMAND' '${TARGET_OS}' failed.  Vagrant VM at ${OVJ_TOOLS}/vms/${TARGET_OS}"
    fi

    return $retval
}

#######################################################################
#
# Main script starts here
#

# make sure OVJ_TOOLS set correctly
if [ ! -f "${OVJ_TOOLS}/OSX.md" ]; then
    log_error 'ERROR: OVJ_TOOLS incorrect: missing OSX.md from "${OVJ_TOOLS}/"'
    usage
fi

# make sure some target was specified
if [ "x${TARGETS}" = x ]; then
    usage
fi

# do the action on all the targets
for TARGET in $TARGETS ; do
    # setup the logfile
    log_setup "build_vm-${TARGET}-${DATESTRING}.log" "${OVJ_TOOLS}"
    log_info "Target:  $TARGET"
    log_info "Actions: $ACTIONS"

    ISUP=no
    for ACTION in $ACTIONS ; do
        if [ $ISUP = no ]; then
            case ${ACTION} in
                build|package|install|test|uninstall)
                    log_info " -----------------------------------------"
                    log_warn "     Setup '${TARGET}'"
                    if ! setup_target "$TARGET" ; then
                        log_error "Unable to start '${TARGET}'"
                        break
                    fi
                    ISUP=yes
                    ;;
            esac
        fi
        log_info " -----------------------------------------"
        log_warn "     ACTION=${ACTION} TARGET=${TARGET}"
        log_info " -----------------------------------------"
        case ${ACTION} in
            build)
                validate_repo
                if ! build_target "$TARGET" ; then log_error "$ACTION failed"; break ; fi
                ;;
            package)
                if ! package_target "$TARGET" ; then log_error "$ACTION failed"; break ; fi
                ;;
            install)
                if ! install_target "$TARGET" install ; then log_error "$ACTION failed"; break ; fi
                ;;
            test)
                if ! install_target "$TARGET" test; then log_error "$ACTION failed"; break ; fi
                ;;
            uninstall)
                if ! install_target "$TARGET" uninstall; then log_warn "$ACTION failed"; fi
                ;;
            clean)
                if ! clean_target "$TARGET" ; then log_warn "clean '$TARGET' failed."; fi
                ISUP=no
                ;;
            distclean)
                if ! clean_target "$TARGET" ; then log_warn "clean '$TARGET' failed."; fi
                if ! distclean_target "$TARGET"; then log_warn "distclean '$TARGET' failed."; break; fi
                ISUP=no
                ;;
        esac
    done
    if [ $ISUP = yes ]; then
        if ! shutdown_target "$TARGET" ; then log_error "Error shutting down VM '$TARGET'" ; fi
    else
        log_warn " Target '$TARGET' wasn't started, skipping shutdown."
    fi
    log_info " Finished with '${TARGET}'"
done

if [ "${ACTION}" = clean ] || [ "${ACTION}" = distclean ]; then
    log_info "vagrant global-status after cleaning:"
    log_cmd vagrant global-status
    exit 0
fi

log_info "$SCRIPT done, ${ERRCOUNT} errors.  Logfile: $LOGFILE"
exit ${ERRCOUNT}
