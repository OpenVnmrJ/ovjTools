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
# build a virtual machine suitable for building / installing OpenVnmrJ
# and make it available to vagrant
#
set -e

TARGET_OS=$1

function usage {
    echo "usage: $0 <centos6 | centos7 | ubuntu14 | trusty64 | xenial64>"
    exit 1
}

# validate the target OS
case $TARGET_OS in
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
    *|help)
        usage
esac

# the boxname
BOXNAME=OpenVnmrJ/$TARGET_OS

# check if this box def already exists, if so just print message and exit
if vagrant box list | grep -q "$BOXNAME" ; then
    echo "found existing box '$BOXNAME'"
    exit 0
else
    echo "creating box '$BOXNAME' from ${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}"
fi

# cd to Vagrant dir, 
cd "${OVJ_TOOLS}/vms/box_defs/${TARGET_OS}"

# make sure no old package file laying around
if [ -f package.box ]; then
    echo "removing old Vagrant package.box file"
    rm package.box
fi

# update any out-of-date vagrant boxes
vagrant box update

# build and setup the VM
vagrant up

# setup environment in the VM
set -x
if [[ "${TARGET_OS}" == centos* ]]; then
    vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.bashrc'
    vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.bashrc'
    vagrant ssh -c 'echo "alias more=less" >> ~/.bashrc'
else
    vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'
    vagrant ssh -c 'echo "export OVJ_TOOLS=$ovjBuildDir/ovjTools" >> ~/.profile'
    vagrant ssh -c 'echo "alias more=less" >> ~/.profile'
fi

# boot-cycle the box, down-up-down, to make sure it boots ok
vagrant reload

# package and name the box
vagrant halt
vagrant package

# add it to local vagrant box library
vagrant box add $BOXNAME package.box

# free up the space
# vagrant destroy -f
