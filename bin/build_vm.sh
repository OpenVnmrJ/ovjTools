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
set -e

SCRIPT="$0"
TARGET_OS="$1"
: ${OVJ_GITBRANCH=master}
: ${OVJT_GITBRANCH=master}
: ${OVJ_DEVELOPER=OpenVnmrJ}
: ${OVJ_VERBOSE=1}

function usage {
    cat <<EOF

usage:
    $SCRIPT <target> [options...]

targets:
    <centos6|centos7|xenian64|
     ubuntu14|trusty64>  - build OpenVnmrJ on the specified platform,
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
while [ $# -gt 1 ]; do
    shift
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
        -q|--quiet)             OVJ_VERBOSE=0                 ;;
        *)
            # unknown option
            echo "unrecognized arg: $key"
            usage
            ;;
    esac
done

# check correctness of ovjBuildDir, and set OVJ_TOOLS if necessary
if [ "x${OVJ_TOOLS}" = "x" ] ; then
    echo "ERROR: set OVJ_TOOLS environment variable to the ovjTools directory"
    usage
fi

if [ ! -f "${OVJ_TOOLS}/OSX.md" ]; then
    echo 'ERROR: OVJ_TOOLS incorrect: missing OSX.md from "${OVJ_TOOLS}/"'
    usage
fi

# validate the target OS
case "${TARGET_OS}" in
    centos6)
        ;;
    centos7)
        ;;
    ubuntu14|trusty64)
        TARGET_OS=trusty64
        ;;
    ubuntu16|xenial64)
        TARGET_OS=xenial64
        ;;
    clean|distclean)
        ;;
    *)
        usage
esac

# if 'clean' then cleanup all the build machines
if [ ${TARGET_OS} = clean -o ${TARGET_OS} = distclean ]; then
    for vmdir in centos6 centos7 trusty64 xenial64 ; do
        echo "Cleaning vms/$vmdir..."
        cd "${OVJ_TOOLS}/vms/$vmdir"
        vagrant destroy -f
    done
fi

# if 'distclean' then cleanup all the build machines, AND all the OpenVnmrJ template boxes
if [ ${TARGET_OS} = distclean ]; then
    for vmdir in centos6 trusty64 xenial64 ; do
        echo "distcleaning vms/box_defs/$vmdir..."
        cd "${OVJ_TOOLS}/vms/box_defs/$vmdir"
        rm -f package.box
        vagrant destroy -f
        # check if this box def already exists, if so just print message and exit
        BOXNAME=OpenVnmrJ/$vmdir
        if vagrant box list | grep -q "$BOXNAME" ; then
            echo "removing box '$BOXNAME'"
            vagrant box remove $BOXNAME
        fi
    done
fi

if [ ${TARGET_OS} = clean -o ${TARGET_OS} = distclean ]; then
    echo "vagrant global-status after cleaning:"
    vagrant global-status
    exit 0
fi

# validate requested developer/branch
if [ "x${OVJ_GITBRANCH}" = "x" ] ; then
    OVJ_GITBRANCH=master
else
    # check that its a valid branch name
    if ! git ls-remote -q --exit-code "http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ" ${OVJ_GITBRANCH} 2>&1 > /dev/null; then
        echo "INVALID branch '${OVJ_GITBRANCH}' for http://github.com/${OVJ_DEVELOPER}/OpenVnmrJ"
        usage
    fi
    if ! git ls-remote -q --exit-code "http://github.com/${OVJ_DEVELOPER}/ovjTools" ${OVJT_GITBRANCH} 2>&1 > /dev/null; then
        echo "INVALID branch '${OVJ_GITBRANCH}' for http://github.com/${OVJ_DEVELOPER}/ovjTools"
        usage
    fi
fi

# make sure the local dev box template is setup
"${OVJ_TOOLS}/bin/build_box.sh" ${TARGET_OS}

# cd to Vagrant dir, build the VM
cd "${OVJ_TOOLS}/vms/${TARGET_OS}"
vagrant halt
vagrant up

# setup environment in the VM
set -x

if [[ "${TARGET_OS}" == centos* ]]; then
    vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.bashrc'
    vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.bashrc'
else
    vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'
    vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
fi

# make the build dir
vagrant ssh -c 'if [ -d ${ovjBuildDir} ]; then echo "removing build dir"; rm -rf ${ovjBuildDir} ; fi '
vagrant ssh -c 'mkdir -p ${ovjBuildDir}'

# build OpenVnmrJ
vagrant ssh -c "cd \$ovjBuildDir && git clone --depth 3 --branch ${OVJ_GITBRANCH} https://github.com/${OVJ_DEVELOPER}/OpenVnmrJ.git"
vagrant ssh -c "cd \$ovjBuildDir && git clone --depth 3 --branch ${OVJT_GITBRANCH} https://github.com/${OVJ_DEVELOPER}/ovjTools.git"
vagrant ssh -c 'cd ${ovjBuildDir} && cp -r ovjTools/bin . '
#todo: fix perms in git and remove this line
vagrant ssh -c 'chmod u+x ${ovjBuildDir}/bin/buildinvm'
time vagrant ssh -c 'cd ${ovjBuildDir}/bin && ./buildinvm'

vagrant ssh -c 'tail -20 ${ovjBuildDir}/logs/makeovj*'

# this still fails... ./load.nmr needs a gui
vagrant halt
VMGUI=y vagrant up
if [[ "${TARGET_OS}" == centos* ]]; then
    # the install script su's to vnmr1
    vagrant ssh -c 'chmod a+xr ${HOME}'
    vagrant ssh -c 'chmod a+xr ${ovjBuildDir}'
    vagrant ssh -c 'chmod a+xr ${ovjBuildDir}/dvdimageOVJ'
fi

vagrant ssh -c 'cd ${ovjBuildDir}/dvdimageOVJ && sudo ./load.nmr '

