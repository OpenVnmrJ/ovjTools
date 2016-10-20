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
onerror() {
    echo "$SCRIPT: Error on line ${BASH_LINENO[0]}, exiting."
    exit 1
}
trap onerror ERR

TARGETS=
ACTION=build
: ${OVJ_GITBRANCH=master}
: ${OVJT_GITBRANCH=master}
: ${OVJ_DEVELOPER=OpenVnmrJ}
: ${OVJ_VERBOSE=1}

function usage {
    cat <<EOF

usage:
    $SCRIPT <target> [options...]

targets:
    <centos6|centos7|macos10.10|ubuntu14|ubuntu16>
                         - build OpenVnmrJ on the specified platform,
                           building any necessary VM images on the way.
    clean                - destroy all VMs used for all platforms
    distclean            - destroy all VMs and all box templates

options:
    -b|--branch branch        branch to build [${OVJ_GITBRANCH}]
    -u|--gitname developer    github account name to build [${OVJ_DEVELOPER}]
    --tbranch branch_name     branch to clone for ovjTools [${OVJT_GITBRANCH}]

Environment Variables:

OVJ_TOOLS     -> path to ovjTools, VM will be in \$OVJ_TOOLS/vms/<os>/

EOF
    exit 1
}
# process flag args
while [ $# -gt 0 ]; do
    key="$1"
    case $key in
        -u|--gitname)           OVJ_DEVELOPER="$2"; shift     ;;
        -b|--branch)
            OVJ_GITBRANCH="$2"
            OVJT_GITBRANCH="$2"
            shift
            ;;
        -b|--branch)            OVJ_GITBRANCH="$2"; shift     ;;
        --tbranch)              OVJT_GITBRANCH="$2"; shift    ;;
        -h|--help)              usage                         ;;
        -v|--verbose)           OVJ_VERBOSE=$(( ${OVJ_VERBOSE} + 1 )) ;;
        -q|--quiet)             OVJ_VERBOSE=$(( ${OVJ_VERBOSE} - 1 )) ;;
        all)
            TARGETS="ubuntu14 ubuntu16 centos6 centos7 macos10.10 "
            ;;
        ubuntu14|ubuntu16|centos6|centos7|macos10.10)
            TARGETS="$TARGETS $key"
            ;;
        clean|distclean)
            ACTION=$key
            ;;
        *)
            # unknown option
            echo "unrecognized arg: $key"
            usage
            ;;
    esac
    shift
done

if [ ${OVJ_VERBOSE} -ge 2 ]; then
    set -x
fi

# check correctness of ovjBuildDir, and set OVJ_TOOLS if necessary
if [ "x${OVJ_TOOLS}" = "x" ] ; then
    echo "ERROR: set OVJ_TOOLS environment variable to the ovjTools directory"
    usage
fi

if [ ! -f "${OVJ_TOOLS}/OSX.md" ]; then
    echo 'ERROR: OVJ_TOOLS incorrect: missing OSX.md from "${OVJ_TOOLS}/"'
    usage
fi

clean_target() {
    local TARGET_OS="$1"
    echo "Cleaning vms/${TARGET_OS}"
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}"
    vagrant destroy -f
    return 0
}

distclean_target() {
    local TARGET_OS="$1"
    if [[ "${TARGET_OS}" == macos* ]]; then
        echo "not discleaning ${TARGET_OS} !!! (you probaly didn't meant that)"
        return 0
    fi
    echo "distcleaning vms/box_defs/${TARGET_OS}"
    cd "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}"
    rm -f package.box
    vagrant destroy -f
    # check if this box def already exists, if so just print message and exit
    BOXNAME=OpenVnmrJ/${TARGET_OS}
    if vagrant box list | grep -q "$BOXNAME" ; then
        echo "removing box '$BOXNAME'"
        vagrant box remove $BOXNAME
    fi
    return 0
}


# validate requested developer/branch
validate_repo() {
    if [ "x${OVJ_GITBRANCH}" = "x" ] ; then
        echo "INVALID branch '${OVJ_GITBRANCH}'"
        usage
    fi
    # check that its a valid branch name
    if ! git ls-remote -q --exit-code "http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ" ${OVJ_GITBRANCH} 2>&1 > /dev/null; then
        echo "INVALID branch '${OVJ_GITBRANCH}' for http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ"
        usage
    fi
    if ! git ls-remote -q --exit-code "http://github.com/${OVJ_DEVELOPER}/ovjTools" ${OVJT_GITBRANCH} 2>&1 > /dev/null; then
        echo "INVALID branch '${OVJ_GITBRANCH}' for http://github.com/${OVJ_DEVELOPER}/ovjTools"
        usage
    fi
}

setup_target() {
    local TARGET_OS="$1"
    local retval=0

    # make sure the local dev box template is setup
    "${OVJ_TOOLS}/bin/build_box.sh" ${TARGET_OS}

    # cd to Vagrant dir, build the VM
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}"
    echo "Setting up build VM in $(pwd)"
    vagrant halt
    vagrant up
    vagrant ssh-config > ./vagrant.ssh.config

    # setup environment in the VM
    if [[ "${TARGET_OS}" == centos* ]]; then
        vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.bashrc'
        vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.bashrc'
    elif [[ "${TARGET_OS}" == ubuntu* ]]; then
        vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'
        vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
    elif [[ "${TARGET_OS}" == macos* ]]; then
        # case-sensitive filesystem at /Volumes/Vagrant1/
        vagrant ssh -c 'echo "export ovjBuildDir=/Volumes/Vagrant1/ovjbuild" >> ~/.profile'
        vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
        #scp -F vagrant.ssh.config "Test Developer.cer" default:
        #vagrant ssh -c "sudo security -v add-trusted-cert -d -r trustRoot -p codeSign -k /Library/Keychains/System.keychain 'Test Developer.cer'"
        #vagrant ssh -c "security find-identity -p codesigning"
    fi

    # check if setting OVJ_TOOLS in the environment works
    vagrant ssh -c 'echo OVJ_TOOLS=$OVJ_TOOLS'
}

build_target() {
    local TARGET_OS="$1"
    local retval=0

    # cd to Vagrant dir, build the VM
    cd "${OVJ_TOOLS}/vms/${TARGET_OS}"
    vagrant up
    vagrant ssh-config > ./vagrant.ssh.config

    # check if setting OVJ_TOOLS in the environment works
    vagrant ssh -c 'echo OVJ_TOOLS=$OVJ_TOOLS'

    # make the build dir
    #vagrant ssh -c 'if [ -d ${ovjBuildDir} ]; then echo "removing build dir"; rm -rf ${ovjBuildDir} ; fi '
    vagrant ssh -c 'mkdir -p ${ovjBuildDir}'

    # build OpenVnmrJ
    # old way
    #vagrant ssh -c "cd \$ovjBuildDir && git clone --depth 3 --branch ${OVJ_GITBRANCH} https://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git"
    #vagrant ssh -c "cd \$ovjBuildDir && git clone --depth 3 --branch ${OVJT_GITBRANCH} https://github.com/${OVJ_DEVELOPER}/ovjTools.git"
    #vagrant ssh -c 'cd ${ovjBuildDir} && cp -r ovjTools/bin . '
    #
    #if time vagrant ssh -c 'cd ${ovjBuildDir}/bin && ./buildinvm'; then
    #    retval=1
    #fi

    scp -F vagrant.ssh.config ${OVJ_TOOLS}/bin/build_release.sh default:
    #BUILD_CMD="./build_release.sh package"
    BUILD_CMD="./build_release.sh checkout build package"
    BUILD_CMD=" ${BUILD_CMD} --gitname ${OVJ_DEVELOPER} --branch ${OVJ_GITBRANCH} "
    echo "running build on VM ${TARGET_OS}"
    if (time vagrant ssh -c "${BUILD_CMD}") ; then
        retval=$?
        echo "RET: $retval"
    else
        retval=$?
        echo "RET: $retval"
    fi

    vagrant ssh -c '${ovjBuildDir}/ovjTools/bin/whatsin $(ls -t ${ovjBuildDir}/logs/build* | head -1) | tail -30'

    # successful build, shutdown the VM
    if [ $retval = 0 ]; then
        vagrant halt
    else
        echo "build ${TARGET_OS} failed. Vagrant running at ${OVJ_TOOLS}/vms/${TARGET_OS}"
    fi

    return $retval
}

install_target() {
    local TARGET_OS="$1"
    local retval=0

    # bring up the VM in gui mode
    VMGUI=y vagrant up

    if [[ "${TARGET_OS}" == centos* ]]; then
        # the install script su's to vnmr1, so these need to be read/exex by vnmr1
        vagrant ssh -c 'chmod a+xr ${ovjBuildDir}/..'
        vagrant ssh -c 'chmod a+xr ${ovjBuildDir}'
        vagrant ssh -c 'chmod a+xr ${ovjBuildDir}/dvdimageOVJ'
    fi

    # this still fails... ./load.nmr needs a gui
    vagrant ssh -c 'cd ${ovjBuildDir}/dvdimageOVJ && sudo ./load.nmr '

    return $retval
}

#
# Main program starts here
#

# make sure some target was specified
if [ "x${TARGETS}" = x ]; then
    usage
fi

# do the action on all the targets
for TARGET in $TARGETS ; do
    case ${ACTION} in
        build)
            validate_repo
            setup_target $TARGET
            build_target $TARGET
            ;;
        install)
            install_target $TARGET
            ;;
        clean)
            clean_target $TARGET
            ;;
        distclean)
            clean_target $TARGET
            distclean_target $TARGET
            ;;
    esac
done

if [ ${ACTION} = clean -o ${ACTION} = distclean ]; then
    echo "vagrant global-status after cleaning:"
    vagrant global-status
    exit 0
fi

echo "$SCRIPT done."
