# ovjTools
Tools and libraries to build OpenVnmrJ. 

## Java

### Ubuntu and RHEL/CentOS
The only tested version is the Java SE Development Kit 6u39. If you want to use Java 8, please try building and **testing** on a spectrometer.   

If you've tested and there are no problems with a newer Java, please file an [issue](https://github.com/OpenVnmrJ/ovjTools/issues).

### OS X
The OS X build ignores the java link and uses the system Java. Java 8u92 was found to work.  
Download and install the Java JDK from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)  
See OSX.md for more information.

## BUILD REQUIREMENTS

Currently, OpenVnmrJ builds as a 32-bit executable, thus needs several i686 libraries installed.  
*A 64-bit build needs to be tested. All components should be built 64-bit and tested.*  

### EL6 (RHEL/CentOS 6)

The minimum package requirement for EL6 assumes that your system was installed with the
"Software Development Workstation" package selection as required by VnmrJ.  This build
configuration has been tested on CentOS 6.7 but should work for any RHEL or CentOS 6.x.  
```
yum install compat-gcc-34-g77 glibc-devel.i686 libstdc++.i686 libX11-devel.i686 libXt-devel.i686 openmotif-devel.i686 scons
```
Optionally, you can also install gsl-devel and libtiff-devel if you wish to compile using the GNU
scientific library.  Code compiled with the GSL will be subject to license restrictions.  
*TODO. Configure using Vagrant.*  

### Ubuntu Trusty Tahr 14.04 LTS

The minimum package requirement for Ubuntu Trusty Tahr 14.04 LTS assumes that you have
installed the standard desktop edition of Ubuntu.  A minimal install may require additional
packages including but not limited to make, unzip and zip.  This build configuration has been
tested on Ubuntu but should work for any buntu Trusty Tahr 14.04 LTS distribution.  

```
sudo apt-get install fort77 g++ lib32stdc++-4.8-dev libc6-dev-i386 libglu1-mesa-dev libmotif-dev:i386 libx11-dev:i386 libxt-dev:i386 scons
```

Optionally, you can also install libgsl0-dev and libtiff5-dev if you wish to compile 
components using the GNU scientific library.  Code compiled with the GSL will be subject
to license restrictions.  

Full package requirements including dependent packages are listed in the appendix of
this document.  

### OS X

See OSX.md

## INSTALLATION & COMPILATION

These instructions work for Ubuntu and CentOS (RHEL).  

Make a directory. Lets call it ovjbuild and change into that directory.
Check out the ovjTools repository from GitHub with  
```
git clone https://github.com/OpenVnmrJ/ovjTools.git
```
or Download it from the GitHub web site. If you download it, move it to the ovjbuild directory
and unzip it with the commands
```
mv ~/Downloads/ovjTools-master.zip .
unzip ovjTools-master.zip
rm ovjTools-master.zip
```

The ovjTools directory contains the following diretories and files.   
```
bin            Scripts to build the OpenVnmrJ package
fftw           Used by xrecon (imaging program)
fftw_mac       Used by xrecon MacOS version (imaging program)
gsllibs        Used by programs in bin_image
java           Used by all java programs. It is a soft link to the java jdk.
JavaPackages   Used by vjmol and vnmrj
jdk1.6.0_39_64 Java jdk.
JMF-2.1.1e     Used by vnmrj (simplemovie.jar)
junit          Used by apt, probeid, and vjclient
NDDS           Used by nvlocki, nvexpproc, nvinfoproc, nvrecvproc, nvsendproc
pgsql          Postgress / Locator code
tcl            This contains headers and libraries for compiling programs that
               require tcl (Roboproc)
```

We compile VnmrJ java programs with jdk1.6.0_39_64. The java in ovjTools should be a soft link
to the actual java JDK. (On Linux).   

At the same level as the ovjTools directory, do the following  

```
  cp -r ovjTools/bin .
  cd bin
```

The bin directory contains three scripts. The buildovj script controls the overall build
process. By default, it should work correctly. However, if you wish to customize the build
process, edit this script.  For example, you may decide not to build the Mercury / Inova
version. Or you may decide to move the ovjTools directory to a different location.
The buildovj script is commented to descibe various options.

Other options are described in that file but the defaults should be okay. The buildovj
script collects all the options and the makeovj script does all the work. In general,
the makeovj script does three things. The first is to update or clone OpenVnmrJ from git.
The second part compiles everything (doScons=yes). The third part collects files into the DVD images
(buildOVJ=yes).  

The OpenVnmrJ directory contains the following directories and files.
These files are open-sourced, read the LICENSE file.  

```
SConstruct   This is the definition file used by scons. It is similar to Makefile used by
             the make command.
scripts      This contains tools used by scons.
src          This contains the source code for OpenVnmrJ. Some of these directories also
             contain a SConstruct file that is used to build / compile that specific
             program.
```

Run the command

```
   ./buildovj
```

This command will compile the entire OVJ package. It will use the OpenVnmrJ/SConstruct file
to  compile the programs in src and place the results in directories at the same level
as the OpenVnmrJ level. The console directory will contain console-specific files.
The vnmr directory will contain files that are generic. The options directory contains
optional software and code that may be optionally installed.  If the buildOVJ and / or
buildOVJMI parameters are set to yes in the buildovj script, additional directories will
be build that are an image of the DVD installer. A log of the build process will be
placed in a logs direcory.  The script whatsin in the bin directory will produce a
summary of the content of the build log file.

In summary, before running the buildovj script, your build directory will have bin
and ovjTools directories and optionally, an OpenVnmrJ directory.  If you have previously
run the buildovj script, there will also be console, logs, options, and vnmr directories.
Depending on your selections in the buildovj script, the default DVD images dvdimageOVJ
and dvdimageOVJMI may also be present.  
When the buildovj script is executed, one of the first things it does is remove any
preexisting console, options, vnmr, and dvd image directories.  

You can also change into specific directories in src and run scons. That will build that
specific program. To compile the java programs, the OVJ_TOOLS env parameter must be set
to point to the ovjTools directory. In a bash shell, the command would be  
```  export OVJ_TOOLS=<path>```
In a csh, the command would be  
```  setenv OVJ_TOOLS <path>```

For example,  
```
cd OpenVnmrJ/src/vnmrbg
scons
```
will build only the Vnmrbg program.  

#### For Linux systems:  
Once the buildovj script is complete, and you had selected the buildOVJ and / or buildOVJMI
parameters, you can cd dvdimageOVJ or dvdimageOVJMI and run ./load.nmr to install a complete
OpenVnmrJ package. If a prior VJ42 install is present (/vnmr is a symbolic link to the VJ42
installation), then the OpenVnmrJ installation will collect various files from the VJ42 install
so that the OpenVnmrJ install should be complete.  See the src/scripts/update_OpenVnmrJ.sh
script. Assuming the VJ42 directory was available, this installed OVJ should be a complete
system capable of data acquisition. After installation, the only thing that should be needed
is "su acqproc" to start the OVJ version of the procs.  

#### For MacOS systems:  
Once the buildovj script is complete, and you had selected the buildOVJ parameter, you 
will have a dvd image that is constructed so that the MacOS utility PackageMaker can be
used to build a MacOS installer. Instructions for building the installer are in
OpenVnmrJ/src/macos/readme_packagemaker. If a prior VJ42 install is present (/vnmr
is a symbolic link to the VJ42 installation), then the OpenVnmrJ installation will
collect various files from the VJ42 install so that the OpenVnmrJ install should be complete.  
*TODO: A single draggable VnmrJ.app.*  

#### Directories
The src directory has a number of subdirectories. In general, each subdirectory corresponds
to one or more programs that need to be compiled. Some of the subdirectories contain code
that is shared by several programs. Some directories also contain a special sconsPostAction
file. These typically are a shell script with symbolic link commands. For example,
src/common/maclib has a sconsPostAction files which creates aliases of some of the macros.
The SConstuct must explicitly execute the sconsPostAction. See the OpenVnmrJ/SConstruct file
for an example.   

The src directory contains the following subdirectories.  

```
3D          Code for compressfid, ft3d, getplane
acqproc     Shared files
admin       VnmrJ installer java program 
aip         Shared files used by vnmrbg. (aip -> advanced image processing)
ampfit      Tools for amplifier linearization (DDR systems)
apt         Auto ProTune java program
aslmirtime  Imaging program (requires GPL license)
Asp         Shared files used by vnmrbg. (Asp -> advanced spectral processing)
atproc      Code for Atproc
autotest    Autotest appdir
backproj    Imaging back-projection tool
bin         Compiled programs in /vnmr/bin
bin_image   Compiled imaging programs in /vnmr/bin (requires GPL license)
biopack     Biopack appdir
biosolidspack Biosolidspack appdir
bootpd.rh51 Bootp program for Inova and Mercury
cgl         Imaging library libcgl.so
common      This contains text files that do not need further processing / compiling,
            including CRAFT.
cryo        Cryobay communications java program
cryomon     Cryo monitor communications java program
ddl         Shared files
ddr         Protocols for DDR
dicom_store Imaging DICOM tool
DOSY        DOSY files
expproc     Expproc for Inova and Mercury
gif         Tools used to build a release DVD
Gilson      VAST files
gxyzshim    3D gradient shimming
ib          Shared files (image browser)
IMAGE       Files for imaging
infoproc    Infoproc for Inova and Mercury
inova       Files to support Inova
ipsglib     Inova specific pulse sequences
jaccount    Accounting program
jplot       jplot program
kpsg        PSG for Mercury
kpsglib     Pulse sequences for Mercury
languages   Support for Chinese and Japanese
layouts     layout XML files
LCNMR       LC-NMR files
license     Current license statements
macos       Tools used to build the MacOS version
magic       Shared files
managedb    Program used by Locator and dbsetup
masproc     Masproc for Inova
mercury     Files to support Mercury
nacqi       Shared files
nautoproc   Autoproc
ncomm       Shared files and acqproc and ncomm libraries.
nvacq       Shared files with DDR console software
nvexpproc   Expproc for DDR systems
nvinfoproc  Infoproc for DDR systems
nvpsg       PSG for DDR systems
nvpsglib    DDR specific pulse sequences
nvrecvproc  Recvproc for DDR systems
nvsendproc  Sendproc for DDR systems
p11         Files for Part 11 option
patch       Tools used to make patches
probeid     probeid communications programPlease
procproc    Procproc
psg         PSG for Inova
psglib      Pulse sequences shared by Inova and DDR
recvproc    Recvproc for Inova and Mercury systems
roboproc    Roboproc
scripts     Scripts in /vnmr/bin (and other scripts used for install, etc)
sendproc    Sendproc for Inova and Mercury systems
shuffler    xml files used by the Locator
solidspack  Solidspack appdir
stars       The STARS solid-state NMR simulation package
stat        Code for Infostat and showstat
tcl         tcl scripts (autotest, etc)
veripulse   veripulse appdir
vjclient    Program used by probeid
vjmol       Auxiliary java program to connect jmol with vnmrj
vjqa        Some quality assurance tests
vnmr        Shared files
vnmrbg      Code for Vnmrbg
vnmrj       vnmrj java program (requires GPL license)
vobj        Shared files
vwacq       Shared files with Inova console software
web         Programs to support tablet
xracq       Shared files with VXR console software
xrecon      Imaging reconstruction program (requires GPL license)
yacc        Original yacc tool for helping to make Magical (no longer used)
```

## APPENDIX
###EL6 (RHEL/CentOS 6)  
Full list of required packages for EL 6 starting from a "Software Development Workstation"  
configuration:  
```
compat-gcc-34
compat-gcc-34-g77
compat-libf2c-34
expat.i686
fontconfig.i686
freetype.i686
glibc.i686
glibc-devel.i686
libgcc.i686
libICE.i686
libjpeg-turbo.i686
libpng.i686
libstdc++.i686
libSM.i686
libuuid.i686
libX11.i686
libX11-devel.i686
libXau.i686
libxcb.i686
libXext.i686
libXft.i686
libXmu.i686
libXp.i686
libXrender.i686
libXt.i686
libXt-devel.i686
nss-softokn-freebl.i686
openmotif.i686
openmotif-devel.i686
scons
zlib.i686  
```
And optionally: (Read LICENSE above) 
```
gsl
gsl-devel
libtiff-devel
```
### Ubuntu Trusty Tahr 14.04 LTS
Full list of required packages for Ubuntu Trusty Tahr 14.04 LTS starting from a standard
desktop edition installation:  
```
f2c
fort77
g++
g++-4.8
gcc-4.8-multilib
gcc-4.9-base:i386
gcc-multilib
lib32asan0
lib32atomic1
lib32gcc-4.8-dev
lib32gcc1
lib32gomp1
lib32itm1
lib32quadmath0
lib32stdc++-4.8-dev
lib32stdc++6Please
libc6-dev-i386
libc6-dev-x32
libc6-i386
libc6-x32
libc6:i386
libdrm-dev
libexpat1:i386
libf2c2
libf2c2-dev
libfontconfig1:i386
libfreetype6:i386
libgcc1:i386
libgl1-mesa-dev
libglu1-mesa-dev
libice-dev:i386
libice6:i386
libjpeg-turbo8:i386
libjpeg8:i386
libmotif-common
libmotif-dev:i386
libmrm4
libmrm4:i386
libpng12-0:i386
libpthread-stubs0-dev
libpthread-stubs0-dev:i386
libsm-dev:i386
libsm6:i386
libstdc++-4.8-dev
libuil4
libuil4:i386
libuuid1:i386
libx11-6:i386
libx11-dev
libx11-dev:i386
libx11-doc
libx11-xcb-dev
libx32asan0
libx32atomic1
libx32gcc-4.8-dev
libx32gcc1
libx32gomp1
libx32itm1
libx32quadmath0
libxau-dev
libxau-dev:i386
libxau6:i386
libxcb-dri2-0-dev
libxcb-dri3-dev
libxcb-glx0-dev
libxcb-present-dev
libxcb-randr0-dev
libxcb-render0-dev
libxcb-shape0-dev
libxcb-sync-dev
libxcb-xfixes0-dev
libxcb1-dev
libxcb1-dev:i386
libxcb1:i386
libxdamage-dev
libxdmcp-dev
libxdmcp-dev:i386
libxdmcp6:i386
libxext-dev
libxext6:i386
libxfixes-dev
libxft2:i386
libxm4
libxm4:i386
libxmu6:i386
libxrender1:i386
libxshmfence-dev
libxt-dev:i386
libxt6:i386
libxxf86vm-dev
mesa-common-dev
scons
uil
x11proto-core-dev
x11proto-damage-dev
x11proto-dri2-dev
x11proto-fixes-dev
x11proto-gl-dev
x11proto-input-dev
x11proto-kb-dev
x11proto-xext-dev
x11proto-xf86vidmode-dev
xorg-sgml-doctools
xtrans-dev
zlib1g:i386
```
And optionally (Read LICENSE above):  
```
libgsl0-dev
libgsl0ldbl
libjbig-dev
libjpeg-dev
libjpeg-turbo8-dev
libjpeg8-dev
liblzma-dev
libtiff5-dev
libtiffxx5
zlib1g-dev
```

