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
# Build script that takes all parameters/control on the command line
# or inherits from the environment, based on buildovj+makeovj
#

# defaults
: ${OVJ_DO_CHECKOUT=no}
: ${OVJ_DO_COMPILE=no}
: ${OVJ_DO_PACKAGE=no}
: ${OVJ_BUILDDIR=$ovjBuildDir}
: ${OVJ_DEVELOPER=OpenVnmrJ}
: ${OVJ_GITBRANCH=master}
: ${OVJ_GITURL="https://github.com/OpenVnmrJ/OpenVnmrJ.git"}
: ${OVJ_GITDEPTH=3}
: ${OVJT_GITBRANCH=master}
: ${OVJT_GITURL="https://github.com/OpenVnmrJ/ovjTools.git"}
: ${OVJT_GITDEPTH=3}
: ${OVJ_SRCRESET=no}
: ${OVJ_PACK_DDR=yes}
: ${OVJ_PACK_MINOVA=yes}
: ${OVJ_SCONSFLAGS="-j 1"}
: ${OVJ_MACOS_APPNAME=OpenVnmrJ_1.1.app}
: ${OVJ_VERBOSE=1}

: ${OVJ_DVDDIR_DDR=dvdimageOVJ}
: ${OVJ_DVDDIR_MINOVA=dvdimageOVJMI}

# remember how we were called
CMDLINE="$0 $@"
SCRIPT="$0"
xUNAMEs=x$(uname -s)
usage() {
    set +x
    cat <<EOF

Either of the environment variables OVJ_TOOLS or ovjBuildDir MUST be set.

usage:
 $SCRIPT [checkout] [compile] [package] [options...]
where [options...] are:
      -d|--bindir dir                - target directory for build [\$ovjBuildDir]
      -u|--gitname github_username   - github account to clone from [$OVJ_DEVELOPER]
      -b|--branch branch_name        - branch to clone, [$OVJ_GITBRANCH]
      -g|--giturl url                - url for OpenVnmrJ git repository, overrides -u/-b
                                       [$OVJ_GITURL]
      --tbranch branch_name          - branch to clone for ovjTools, ie [$OVJT_GITBRANCH]
      -t|--tgiturl url               - url for ovjTools git repository, overrides -u/-b
                                       [$OVJT_GITURL]
      --gitdepth num                 - argument for --depth in git clone [$OVJ_GITDEPTH]
      -r|--srcreset                  - reset the OpenVnmr/src directory before compiling
      --ddr yes|no                   - enable Direct-Drive (VnmrS/DD2/ProPulse) DVD build
                                       [$OVJ_PACK_DDR]
      --inova yes|no                 - enable Mercury/Inova DVD build [$OVJ_PACK_MINOVA]
      -j scons_j_option              - flags to pass to scons [$OVJ_SCONSFLAGS]
      -a|--macos_appname name        - macOS App name [$OVJ_MACOS_APPNAME]
      -v|--verbose                   - be more verbose (can add multiple times)
      -q|--quiet                     - be extra quiet to the console

EOF
    exit 1
}

# process flag args
while [ $# -gt 0 ]; do
    key="$1"
    case $key in
        checkout)               OVJ_DO_CHECKOUT=yes           ;;
        compile)                OVJ_DO_COMPILE=yes            ;;
        package)                OVJ_DO_PACKAGE=yes            ;;
        -u|--gitname)
            OVJ_DEVELOPER="$2"
            OVJ_GITURL="https://github.com/$OVJ_DEVELOPER/OpenVnmrJ.git"
            OVJT_GITURL="https://github.com/$OVJ_DEVELOPER/ovjTools.git"
            shift
            ;;
        -b|--branch)            OVJ_GITBRANCH="$2"; shift     ;;
        --tbranch)              OVJT_GITBRANCH="$2"; shift    ;;
        -g|--giturl)            OVJ_GITURL="$2"; shift        ;;
        -d|--bindir)            OVJ_BUILDDIR="$2"; shift      ;;
        -j)                     OVJ_SCONSFLAGS="$2"; shift    ;;
        -a|--macos_appname)     OVJ_MACOS_APPNAME="$2"; shift ;;
        --ddr)                  OVJ_PACK_DDR="$2"; shift      ;;
        --inova)                OVJ_PACK_MINOVA="$2"; shift   ;;
        -h|--help)              usage                         ;;
        -v|--verbose)           OVJ_VERBOSE=$(( $OVJ_VERBOSE + 1 )) ;;
        -q|--quiet)             OVJ_VERBOSE=0                 ;;
        *)
            # unknown option
            echo "unrecognized arg: $key"
            usage
            ;;
    esac
    shift # shift out flag
done

#######################################################################
#
# helper functions
#

# names of the log levels
LEVELNAMES=( error warn info debug )
set -x
set -e

# call this before calling any log commands
setup_logfile () {
    date=$(date +%F_%T)
    if [ ! -d "${OVJ_BUILDDIR}/logs" ]; then
        echo "creating log directory '${OVJ_BUILDDIR}/logs'"
        mkdir -p "${OVJ_BUILDDIR}/logs"
    fi
    OVJ_LOGFILE="${OVJ_BUILDDIR}/logs/build.$date"
    # how this script was called
    log_debug "$CMDLINE"
}
log_msg () {
    level=$1
    shift
    message="$@"
    echo "${LEVELNAMES[level]}: \"$message\"" >> $OVJ_LOGFILE
    if [ $OVJ_VERBOSE -ge $level ]; then
        echo "${LEVELNAMES[level]}: $message"
    fi
}
log_debug () {
    log_msg 3 "$@"
}
log_info () {
    log_msg 2 "$@"
}
log_warn () {
    log_msg 1 "$@"
}
log_error () {
    log_msg 0 "$@"
    exit 1
}
log_cmd () {
    # log it
    log_debug "\$ $SCRIPT @$"
    echo "\$ @$" >> "$OVJ_LOGFILE"
    # execute it
    echo "@$ 2>&1 >> $OVJ_LOGFILE"
}

#######################################################################
#
# checkout sources into $OVJ_BUILDDIR
#
do_checkout () {
    # check that the requested git repo exists

    # check if the OpenVnmrJ directory already exists in $OVJ_BUILDDIR
    if [ -e "$OVJ_BUILDDIR/OpenVnmrJ" ]; then
        log_info "checkout: Can't: OpenVnmrJ source directory $OVJ_BUILDDIR/OpenVnmrJ already exists."
        # do something, like delete it?
        
        log_error "checkout: source directory $OVJ_BUILDDIR/OpenVnmrJ already exists"
    fi

    # make directory if necessary, then cd there
    if [ ! -d "$OVJ_BUILDDIR" ]; then
        log_info "checkout: build directory $OVJ_BUILDDIR doesnt exist, creating..."
        log_cmd mkdir -p "$OVJ_BUILDDIR"
    fi
    log_cmd cd "${OVJ_BUILDDIR}"

    # clone the requested git repo 
    log_cmd git clone --branch $OVJ_GITBRANCH --depth $OVJ_GITDEPTH $OVJ_GITURL

    # clone the requested git repo -- if ovjTools doesnt exist, clone it too
    if [ ! -d "OVJ_BUILDDIR/ovjTools" ]; then
        log_cmd git clone --branch $OVJT_GITBRANCH --depth $OVJT_GITDEPTH $OVJT_GITURL
    fi

    # check that the thing actually checked out an OpenVnmrJ directory
    if [ ! -d "${OVJ_BUILDDIR}/OpenVnmrJ/src/vnmr" ]; then
        log_error "checkout: git clone of '$OVJ_GITURL' didnt create valid OpenVnmrJ source directory"
    fi

    # ok done
}

#######################################################################
#
# compile the sources in
#
do_compile () {
    # check that the source, OpenVnmrJ, exists in $OVJ_BUILDDIR
    # check that the thing actually checked out an OpenVnmrJ directory
    if [ ! -d "${OVJ_BUILDDIR}/OpenVnmrJ/src/vnmr" ]; then
        log_error "compile: '$OVJ_BUILDDIR/OpenVnmrJ/' is not a valid OpenVnmrJ source directory"
    fi

    # if src/ reset requeste, reset it
    if [ $OVJ_SRCRESET = yes ]; then
        log_info "compile: Removing $dvdBuildName1 $dvdBuildName2 options vnmr console <<<==="
        log_cmd rm -rf $dvdBuildName1 $dvdBuildName2 options vnmr console
    fi
    
    # run scons
    cd "$OVJ_BUILDDIR/OpenVnmrJ/"
    log_cmd scons $OVJ_SCONSFLAGS
}

#######################################################################
#
# package the build into a directory suitable for a DVD image
#
do_package () {
    # args
    PACK_SCRIPT="$1"
    OUTPUT_DIR="$2"
    PACK_SCRIPT_SRC="$OVJ_BUILDDIR/OpenVnmrJ/src/scripts/$PACK_SCRIPT"
    log_info "package: packing using script $PACK_SCRIPT"
    # used by a sub-script (?)
    workspacedir=$ovjBuildDir
    dvdBuildName1=$OVJ_DVDDIR_DDR    # used in ovjmacout.sh,ovjddrout.sh
    dvdBuildName2=$OVJ_DVDDIR_MINOVA # used in ovjmiout.sh
    shortDate=$(date +%F)
    ovjAppName=$OVJ_MACOS_APPNAME

    if [ ! -x "$PACK_SCRIPT" ]; then
        log_error "package: missing/invalid/unexecutable packaging script requeted: '$PACK_SCRIPT'"
    fi

    # export vars used by the ovj???out.sh scripts
    export workspacedir dvdBuildName1 dvdBuildName2

    # run the packing script
    log_cmd cd $OVJ_BUILDDIR/bin/
    log_cmd cp $PACK_SCRIPT_SRC ./
    log_cmd make $PACK_SCRIPT # what does this do?
    log_cmd $PACK_SCRIPT

    # make a second copy? make an iso?
    dvdCopyName1=OVJ_$shortDate
    dvdCopyName2=OVJ_MI_$shortDate
}

#######################################################################
#
# main part of the script
#

#
# check validity of arguments
#
if [ $xUNAMEs == "xDarwin" ]; then
    # disallow Mercury/Inova build
    echo todo
fi

# create OVJ_BUILDDIR if it's set and doesn't exist
if [ x"$OVJ_BUILDDIR" != x ]; then
    if [ ! -d "$OVJ_BUILDDIR" ]; then
        echo "OVJ_BUILDDIR [$OVJ_BUILDDIR] doesn't exist, creating..."
        echo mkdir -p "OVJ_BUILDDIR"
    fi

    if [ x"$OVJ_TOOLS" != x ]; then
        # make sure OVJ_TOOLS is a subdir of OVJ_BUILDDIR
        if [ "$OVJ_BUILDDIR/ovjTools" != "$OVJ_TOOLS" ]; then
            log_error "args: OVJ_TOOLS must be a subdir of OVJ_BUILDDIR"
        fi
    else
        # if OVJ_TOOLS isnt' set, but OVJ_BUILDDIR is, then set OVJ_TOOLS to $OVJ_BUILDDIR/ovjTools
        OVJ_TOOLS="$OVJ_BUILDDIR/ovjTools"
        echo "OVJ_TOOLS not set, assuming [$OVJ_TOOLS]"
    fi
fi

# 
if [ ! -f "$OVJ_TOOLS/OSX.md" ]; then
    echo 'ERROR: directory configuration not correct, missing OSX.md from "$OVJ_TOOLS/"'
    usage
fi

#
# setup log file
#
setup_logfile

# do the requested actions... (in their own subshells)
if [ "$OVJ_DO_CHECKOUT" == yes ]; then
    (do_checkout)
fi
if [ "$OVJ_DO_COMPILE" == yes ]; then
    (do_compile)
fi
if [ "$OVJ_DO_PACKAGE" == yes ]; then
    if [ "$OVJ_PACK_DDR"=yes ]; then
        if [ "$OVJ_PACK_DDR"=yes ]; then
            if [ $xUNAMEs == "xDarwin" ]; then
                (do_package ovjmacout.sh $OVJ_DVDDIR_DDR)
            else
                (do_package ovjddrout.sh $OVJ_DVDDIR_DDR)
            fi
        fi
    fi
    if [ "$OVJ_PACK_MINOVA"=yes ]; then
        (do_package ovjmiout.sh $OVJ_DVDDIR_MINOVA)
    fi
fi

# let the user know they didn't ask for anything, in case they wonder why nothing happend
if [ "$OVJ_DO_CHECKOUT" == no -a "$OVJ_DO_COMPILE" == no -a "$OVJ_DO_PACKAGE" == no ] ; then
    set +x
    echo "No action specified:"
    usage
fi
