#!/bin/bash
#
# Copyright (C) 2016  Michael Tesch
#
# You may distribute under the terms of either the GNU General Public
# License or the Apache License, as specified in the LICENSE file.
#
# For more information, see the LICENSE file.
#

#
# build OVJ locally in a virtual machine
#

SCRIPT=$(basename "$0")
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
onerror() {
    echo "$(tput setaf 1)$SCRIPT: Error on line ${BASH_LINENO[0]}, exiting.$(tput sgr0)"
    if [ -t 3 ]; then
        echo "$(tput setaf 1)$SCRIPT: Error on line ${BASH_LINENO[0]}, exiting.$(tput sgr0)" >&3
        exec 1>&3 2>&4
    fi
    exit 1
}
trap onerror ERR

TARGETS=
ACTION=build
: "${OVJ_FRESHSRC=no}"
: "${OVJ_GITBRANCH=master}"
: "${OVJT_GITBRANCH=master}"
: "${OVJ_DEVELOPER=OpenVnmrJ}"
: "${OVJ_VERBOSE=2}"
: "${OVJ_LOGFILE=buildvm.log}"
: "${OVJ_KEEPRUN=no}"
: "${OVJ_KEEPBOX=no}"

# set OVJ_TOOLS if necessary
if [ "x${OVJ_TOOLS}" = "x" ] ; then
    if [ -d "$SCRIPTDIR/vms/box_defs" ]; then
        OVJ_TOOLS="$SCRIPTDIR"
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

if [ ! -f "${OVJ_TOOLS}/OSX.md" ]; then
    log_error 'ERROR: OVJ_TOOLS incorrect: missing OSX.md from "${OVJ_TOOLS}/"'
    usage
fi

function usage {
    cat <<EOF
usage:
  $SCRIPT <targets...> [options...]

targets:
  <centos6|centos7|macos10.10|ubuntu14|ubuntu16|...>
                       - build OpenVnmrJ on the specified platform,
                         building any necessary VM images on the way.
  clean                - destroy all VMs used for all platforms
  distclean            - destroy all VMs and all box templates

options:
  -f|--freshsrc             rebuild from scratch, checkout fresh repos [${OVJ_FRESHSRC}]
  -k|--keeprunning          leave the VM running after building [${OVJ_KEEPRUN}]
  --keepbox                 save the VM 'box' after building it [${OVJ_KEEPBOX}]
  -b|--branch branch        branch to build [${OVJ_GITBRANCH}]
  -u|--gitname developer    github account name to build [${OVJ_DEVELOPER}]
  --tbranch branch_name     branch to clone for ovjTools [${OVJT_GITBRANCH}]

Environment Variables:
OVJ_TOOLS     -> path to ovjTools, VM will be in \$OVJ_TOOLS/vms/<os>/
EOF
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
        -h|--help)              usage                         ;;
        -v|--verbose)           OVJ_VERBOSE=$(( OVJ_VERBOSE + 1 )) ;;
        -q|--quiet)             OVJ_VERBOSE=$(( OVJ_VERBOSE - 1 )) ;;
        all)
            TARGETS="ubuntu14 ubuntu16 centos6 centos7 macos10.10 "
            ;;
        clean|distclean)
            ACTION=$key
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

if [ ${OVJ_VERBOSE} -gt 2 ]; then
    set -x
fi

#######################################################################
#
# helper functions
#

# call this before calling any log commands
log_setup () {
    LOGFILE="$1"       # typically $(basename "$0")
    local LOGDIR
    LOGDIR="$(dirname "$2")"  # directory for log files, will try to mkdir -p if non-existant

    # colors & names of the log levels
    # check if stdout is a terminal...
    if test -t 1; then
        # see if it supports colors...
        ncolors=$(tput colors)
        if test -n "$ncolors" && test "$ncolors" -ge 8; then
            normal="$(tput sgr0)"
            red="$(tput setaf 1)"
            green="$(tput setaf 2)"
            yellow="$(tput setaf 3)"
            cyan="$(tput setaf 6)"
            white="$(tput setaf 7)"
            magenta="$(tput setaf 5)"
        fi
    fi
    LEVELNAMES=( ERROR WARN INFO DEBUG )
    LEVELCOLOR=( "$red" "$yellow" "$green" "$cyan" )
    #set -x

    if [ ! -d "$LOGDIR" ]; then
        echo "creating log directory '$LOGDIR'"
        mkdir -p "$LOGDIR" || return $?
    fi
    if [ ! -d "$LOGDIR" ]; then
        echo "${red}Unable to create log directory '$LOGDIR':${normal}"
        echo "${red}  log messages will be printed to the terminal.${normal}"
        return
    fi
    exec 3>&1 4>&2
    trap 'exec 1>&3 2>&4' 0
    trap 'exec 1>&3 2>&4; exit 1' 1 2 3
    #trap 'onerror' 0 1 2 3
    if [ ${OVJ_VERBOSE} -gt 2 ]; then
        # at VERBOSE >= DEBUG level, also send cmd output to terminal
        exec 1> >(tee -a "${LOGFILE}") 2>&1
    else
        exec 1> "$LOGFILE" 2>&1
    fi
    # how this script was called
    log_debug "$CMDLINE"
    log_info "Logfile: $LOGFILE"
}
log_msg () {
    local level=$1
    shift
    #local datestring=$(date +"%Y-%m-%d %H:%M:%S")
    local message="$*"
    echo "${LEVELNAMES[level]}:$message"
    if [ ${OVJ_VERBOSE} -ge "$level" ] && [ -t 3 ]; then
        echo "${LEVELCOLOR[level]}${LEVELNAMES[level]}:${message}${normal}" >&3
    fi
}
log_error () {
    log_msg 0 "$*"
}
log_warn () {
    log_msg 1 "$*"
}
log_info () {
    log_msg 2 "$*"
}
log_debug () {
    log_msg 3 "$*"
}
log_cmd () {
    # log it, and send the cmd output to stdout
    log_info "\$ $*"
    # execute it
    if [ -t 3 ]; then
        eval "$@" >&3
    else
        eval "$@"
    fi
}
cmdspin () {
    #
    # Run a command, spin a wheelie while it's running
    #
    log_info "Cmd started $(date)"
    log_info "\$ $*"
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
    # command here
    eval "$@"
    retval=$?
    # Kill the loop and unset the EXIT trap
    kill -PIPE $SPINNER_PID
    trap " " EXIT
    if [ -t 3 ]; then echo "" >&3 ; fi
    log_info "Cmd finished $(date), returned: $retval"
    return $retval
}
vrun () {
    #
    # Run a command on the VM, spin a wheelie while it's running
    #
    # only call this after `vagrant ssh-config` has initialized 'vagrant ssh'
    VCMD="$*"
    local retval
    echo "${magenta}VM\$ $VCMD${normal}"
    if [ -t 3 ] && [ $OVJ_VERBOSE -ge 1 ]; then
        echo "${magenta}VM\$ $VCMD${normal}" >&3 ;
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
    trap " " EXIT
    if [ $retval = 0 ]; then
        if [ $OVJ_VERBOSE -ge 1 ]; then
            if [ -t 3 ]; then echo "${magenta}OK${normal}" >&3 ; fi
        fi
        echo "${magenta}OK${normal}"
    else
        if [ -t 3 ]; then echo "${magenta}FAILED=$retval${normal}" >&3 ; fi
        echo "${magenta}FAILED=$retval${normal}"
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
    vagrant destroy -f
    return 0
}

distclean_target() {
    local TARGET_OS="$1"
    if [[ "${TARGET_OS}" == macos* ]]; then
        log_warn "not discleaning ${TARGET_OS} !!! (you probaly didn't meant that)"
        return 0
    fi
    log_info "distcleaning vms/box_defs/${TARGET_OS}"
    cd "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}" || log_warn "target ${TARGET_OS} missing" && return $?
    log_cmd rm -f package.box
    vagrant destroy -f
    # check if this box def already exists, if so just print message and exit
    BOXNAME=OpenVnmrJ/${TARGET_OS}
    if vagrant box list | grep -q "$BOXNAME" ; then
        log_info "removing box '$BOXNAME'"
        vagrant box remove "$BOXNAME"  || log_warn "box remove ${TARGET_OS} missing" && return $?
    fi
    return 0
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
    log_info "http://github.com/${OVJ_DEVELOPER}/ovjTool branch=${OVJT_GITBRANCH} valid"
}

build_box() {
    # build a vagrant "box"
    local TARGET_OS
    local BOXNAME
    TARGET_OS="$1"

    # the vagrant boxname
    BOXNAME="OpenVnmrJ/$TARGET_OS"

    # check if this box def already exists, if so just print message and exit
    if vagrant box list | grep -q "$BOXNAME" ; then
        log_info "found existing vagrant box '$BOXNAME'"
        return 0
    else
        log_info "creating vagrant box '$BOXNAME' from ${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}"
    fi

    # cd to Vagrant box_def dir, 
    cd "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}" || return $?

    # check if jdk for macos is available (no way to download it automatically)
    if [[ "${TARGET_OS}" == macos* ]]; then
        JAVA_DMG=(jdk-8u*-macosx-x64.dmg)
        if [ ! -f "${JAVA_DMG}" ]; then
            log_error "please download the macOS java SDK (${JAVA_DMG}) and place it in $(pwd) before running this."
            log_error " maybe from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html"
            exit -1
        fi
    fi

    # make sure no old package file laying around
    if [ -f package.box ]; then
        echo "removing old Vagrant package.box file"
        rm package.box
    fi

    # update any out-of-date vagrant boxes
    cmdspin vagrant box update

    # build and setup the VM
    log_info "Creating the box VM '$BOXNAME'"
    cmdspin vagrant up || return $?

    # setup environment in the VM
    case "${TARGET_OS}" in
        centos*|ubuntu18)
            vagrant ssh -c 'echo "alias more=less" >> ~/.bashrc'
            ;;
        *)
            vagrant ssh -c 'echo "alias more=less" >> ~/.profile'
            ;;
    esac

    # setup java sdk on macos
    if [[ "${TARGET_OS}" == macos* ]]; then
        log_info "Installing java package '${JAVA_DMG}' for macos"
        sshpass -p vagrant scp -P 2222 "${JAVA_DMG}" vagrant@127.0.0.1:
        vagrant ssh -c "sudo hdiutil attach ${JAVA_DMG}" || return $?
        vagrant ssh -c 'sudo installer -pkg /Volumes/JDK*/JDK*.pkg -target /' || return $?
        #vagrant ssh -c "sudo rm ${JAVA_DMG}"
    fi

    # boot-cycle the box, down-up-down, to make sure it boots ok
    vagrant reload || return $?

    # halt, package, and name the box
    vagrant halt
    cmdspin vagrant package || return $?

    # add it to local vagrant box library
    vagrant box add "$BOXNAME" package.box || return $?

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

    log_info "setting up target ${TARGET_OS}..."

    # make sure the local dev box template is setup
    if [ -d ${OVJ_TOOLS}/vms/box_defs/${TARGET_OS} ]; then
        build_box "${TARGET_OS}" || return $?
        # "${OVJ_TOOLS}/bin/build_box.sh" "${TARGET_OS}" || return $?
    fi

    # cd to dir containing TARGET_OS's Vagrantfile, fire-up the VM
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?
    log_info "Setting up build VM in $(pwd)"
    cmdspin vagrant halt
    cmdspin vagrant up || return $?
    vagrant ssh-config > ./vagrant.ssh.config || return $?

    # setup environment in the VM
    if [[ "${TARGET_OS}" == centos* ]]; then
        vrun 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.bashrc'
        vrun 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.bashrc'
    elif [[ "${TARGET_OS}" == ubuntu* ]]; then
        vrun 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'
        vrun 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
    elif [[ "${TARGET_OS}" == macos* ]]; then
        # case-sensitive filesystem at /Volumes/Vagrant1/
        vrun 'echo "export ovjBuildDir=/Volumes/Vagrant1/ovjbuild" >> ~/.profile'
        vrun 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
        #scp -F vagrant.ssh.config "Test Developer.cer" default:
        #vrun "sudo security -v add-trusted-cert -d -r trustRoot -p codeSign -k /Library/Keychains/System.keychain 'Test Developer.cer'"
        #vrun "security find-identity -p codesigning"
    fi

    # check if setting OVJ_TOOLS in the environment works
    vrun 'echo OVJ_TOOLS=$OVJ_TOOLS'
    return $?
}

build_target() {
    local TARGET_OS="$1"
    local retval=0

    log_info "building target VM ${TARGET_OS}..."

    # cd to Vagrant dir, build the VM
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?
    vagrant up || return $?
    vagrant ssh-config > ./vagrant.ssh.config

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

    # checkout the source within the VM
    if ! vrun "cd \$ovjBuildDir/OpenVnmrJ"; then
        log_info "checking out OpenVnmrJ 'http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git' b=${OVJ_GITBRANCH}"
        vrun "cd \$ovjBuildDir && pwd"
        vrun "cd \$ovjBuildDir && git clone --depth 3 --branch ${OVJ_GITBRANCH} http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git"
    fi
    if ! vrun "cd \$ovjBuildDir/ovjTools"; then
        log_info "checking out ovjTools 'http://github.com/${OVJ_DEVELOPER}/ovjTools.git' b=${OVJT_GITBRANCH}"
        vrun "cd \$ovjBuildDir && git clone --depth 3 --branch ${OVJT_GITBRANCH} http://github.com/${OVJ_DEVELOPER}/ovjTools.git"
        # this might be unnecessary?
        vrun 'cd ${ovjBuildDir} && cp -r ovjTools/bin . '
    fi

    # verify that the checkout worked
    vrun 'ls $OVJ_TOOLS' || return $?

    #
    # build & package OpenVnmrJ!
    #
    #scp -F vagrant.ssh.config "${OVJ_TOOLS}/bin/build_release.sh" default:
    #BUILD_CMD="./build_release.sh package"
    BUILD_CMD="OVJ_VERBOSE=${OVJ_VERBOSE} \$ovjBuildDir/OpenVnmrJ/scripts/build_release.sh checkout build package"
    BUILD_CMD=" ${BUILD_CMD} --gitname ${OVJ_DEVELOPER} --branch ${OVJ_GITBRANCH} --tbranch ${OVJT_GITBRANCH}"

    log_info "running build on VM ${TARGET_OS}"
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

    # build done, shutdown the VM, print status
    if [ ${OVJ_KEEPRUN} = no ]; then
        log_info "shutting down '${TARGET_OS}' VM"
        vagrant halt
    fi
    if [ $retval = 0 ]; then
        log_warn "build ${TARGET_OS} success."
    else
        log_warn "build ${TARGET_OS} failed.  Vagrant VM at ${OVJ_TOOLS}/vms/${TARGET_OS}"
    fi

    return $retval
}

install_target() {
    local TARGET_OS="$1"

    log_info "installing target ${TARGET_OS}..."

    # cd to Vagrant dir, build the VM
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}" || return $?

    # bring up the VM in gui mode
    VMGUI=y vagrant up || return $?
    vagrant ssh-config > ./vagrant.ssh.config

    if [[ "${TARGET_OS}" == centos* ]]; then
        # the install script su's to vnmr1, so these need to be read/exex by vnmr1
        vrun 'chmod a+xr ${ovjBuildDir}/..'
        vrun 'chmod a+xr ${ovjBuildDir}'
        vrun 'chmod a+xr ${ovjBuildDir}/dvdimageOVJ'
    fi

    # this still fails... ./load.nmr needs a gui
    #
    # TODO
    #
    vrun 'cd ${ovjBuildDir}/dvdimageOVJ && sudo ./load.nmr '

    return $?
}

#######################################################################
#
# Main script starts here
#

# setup the logfile
log_setup "${OVJ_LOGFILE}"

# make sure some target was specified
if [ "x${TARGETS}" = x ]; then
    usage
fi

# do the action on all the targets
for TARGET in $TARGETS ; do
    log_info " -----------------------------------------"
    log_warn "     ACTION=${ACTION} TARGET=${TARGET}"
    log_info " -----------------------------------------"
    case ${ACTION} in
        build)
            validate_repo
            if ! setup_target "$TARGET" ; then continue ; fi
            if ! build_target "$TARGET" ; then continue ; fi
            ;;
        install)
            if ! install_target "$TARGET" ; then continue ; fi
            ;;
        clean)
            clean_target "$TARGET"
            ;;
        distclean)
            clean_target "$TARGET"
            distclean_target "$TARGET"
            ;;
    esac
done

if [ "${ACTION}" = clean ] || [ "${ACTION}" = distclean ]; then
    log_info "vagrant global-status after cleaning:"
    log_cmd vagrant global-status
    exit 0
fi

log_info "$SCRIPT done."
