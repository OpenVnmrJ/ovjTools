#!/bin/bash

#
# build OVJ locally in a virtual machine
#
set -e

TARGET_OS=$1

function usage {
    echo "usage: $0 <centos7|ubuntu14|trusty64>"
    exit 1
}

# check correctness of ovjBuildDir, and set OVJ_TOOLS if necessary
if [ x$ovjBuildDir = "x" ] ; then
   echo "ERROR: set ovjBuildDir environment variable to the directory containing ovjTools/ and OpenVnmrJ/"
   echo "ie: export ovjBuildDir=$HOME/src/OpenVnmrJBuild/"
   exit 1
fi

if [ ! -d "$ovjBuildDir/ovjTools" ]; then
    echo 'ERROR: directory configuration not correct, missing ovjTools from $ovjBuildDir/ovjTools'
    exit 1
fi

if [ ! -d "$ovjBuildDir/OpenVnmrJ" ]; then
    echo 'ERROR: directory configuration not correct, missing ovjTools from $ovjBuildDir/ovjTools'
    exit 1
fi

# standard export
export OVJ_TOOLS=$ovjBuildDir/ovjTools

# validate the target OS
case $TARGET_OS in
    centos7)
        ;;
    ubuntu14|trusty64)
        TARGET_OS=trusty64
        ;;
    *)
        usage
esac

# setup the odd bin dir, if not yet done
if [ ! -d "$ovjBuildDir/bin" ]; then
    echo "copying $ovjBuildDir/ovjTools/bin to $ovjBuildDir/bin"
    cp -a $ovjBuildDir/ovjTools/bin $ovjBuildDir/bin
fi

# build the VM, and copy the source to it
cd $OVJ_TOOLS/vms/$TARGET_OS
vagrant up

# setup the environment
vagrant ssh -c 'echo "export OVJ_TOOLS=$HOME/ovjbuild/ovjTools" >> ~/.profile'
vagrant ssh -c 'echo "export ovjBuildDir=$HOME/ovjbuild" >> ~/.profile'

# build OpenVnmrJ
vagrant ssh -c 'mkdir -p $ovjBuildDir'
vagrant ssh -c 'cd $ovjBuildDir && git checkout https://github.com/OpenVnmrJ/OpenVnmrJ.git'
vagrant ssh -c 'cd $ovjBuildDir && git checkout https://github.com/OpenVnmrJ/ovjTools.git'
vagrant ssh -c 'cd $ovjBuildDir && cp -r ovjTools/bin .'
vagrant ssh -c 'cd $ovjBuildDir/bin && ./buildovj'
