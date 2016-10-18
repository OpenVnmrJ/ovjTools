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

TARGET_OS=$1

function usage {
    echo "usage: $0 < centos6 | centos7 | ubuntu14 | trusty64 >"
    exit 1
}

# check correctness of ovjBuildDir, and set OVJ_TOOLS if necessary
if [ "x$OVJ_TOOLS" = "x" ] ; then
    echo "ERROR: set OVJ_TOOLS environment variable to the ovjTools directory"
    echo "ie: export OVJ_TOOLS=$HOME/src/OpenVnmrJBuild/ovjTools"
    exit 1
fi

if [ ! -f "$OVJ_TOOLS/OSX.md" ]; then
    echo 'ERROR: directory configuration not correct, missing OSX.md from \$OVJ_TOOLS/'
    exit 1
fi

# validate the target OS
case $TARGET_OS in
    centos6)
        ;;
    centos7)
        ;;
    ubuntu14|trusty64)
        TARGET_OS=trusty64
        ;;
    *)
        usage
esac

# build the VM, and copy the source to it
cd $OVJ_TOOLS/vms/$TARGET_OS
vagrant up --provider virtualbox

# setup the environment in the VM
set -x
if [[ $TARGET_OS == centos* ]]; then
    vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.bashrc'
    vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.bashrc'
else
    vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'
    vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
fi    

# build OpenVnmrJ
vagrant ssh -c 'mkdir -p $ovjBuildDir'
vagrant ssh -c 'cd $ovjBuildDir && git clone https://github.com/OpenVnmrJ/OpenVnmrJ.git'
vagrant ssh -c 'cd $ovjBuildDir && git clone https://github.com/OpenVnmrJ/ovjTools.git'
vagrant ssh -c 'cd $ovjBuildDir && cp -r ovjTools/bin . '
vagrant ssh -c 'cd $ovjBuildDir/bin && ./buildovj'

vagrant ssh -c 'cd $ovjBuildDir/dvdimageOVJ && sudo ./load.nmr'
