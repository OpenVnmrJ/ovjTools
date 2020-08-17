# ovjTools
Tools and libraries to build [OpenVnmrJ](http://openvnmrj.org).

## BUILD REQUIREMENTS

OpenVnmrJ has been built on CentOS 6, 7, and 8 and on Ubuntu 18 and 20
and on MacOS 10.10 (Yosemite). The CentOS and Ubuntu builds make a
combination of 32-bit and 64-bit executables. The MacOS build makes only 64-bit
executables. To build on MacOS, see the [OSX.md](https://github.com/OpenVnmrJ/ovjTools/blob/master/OSX.md) document.

### Virtual Machine Container

The only requirement to build in a VM is to have the free tools
[VirtualBox](https://www.virtualbox.org/) and
[Vagrant](https://www.vagrantup.com/) installed on your build machine.
This will save you the trouble of installing and configuring an
operating system.  Build instructions for VM containers are
[below](#in-a-virtual-machine).

## BUILDING

### In a Virtual Machine

There are several ready-to-use VM descriptions (using
[Vagrant](https://www.vagrantup.com/) ) for CentOS 6/7 and Ubuntu
14.04 16.04, and 18.04.  These automatically create and configure the
OS in a VM for building and running OpenVnmrJ.  The Vagrant files and
machines live in the [vms/](vms/) directory.

To build OpenVnmrJ using one of these machine descriptions, install
[Vagrant](https://www.vagrantup.com/) and the [vbguest
plugin](https://github.com/dotless-de/vagrant-vbguest), then from this
repository (`ovjTools`) run the VM build script
[build_vm.sh](bin/build_vm.sh):

(in this example CentOS 6)

```sh
git clone git@github.com:OpenVnmrJ/ovjTools.git
cd ovjTools
./bin/build_vm.sh centos6   # do the actual build, may take ~1 h the first time
```

to build for multiple OS targets at the same time, just add the target
name to the command line, currently tested targets are `centos6`,
`centos7`, `ubuntu14`, `ubuntu16`, and `ubuntu18`.  By default, the
build_vm.sh script performs a full "from scratch" clean + build +
install + test cycle, but it can be limited to do any one or
combination of these by simply specifying the action on the command
line, a basic: `./build_vm.sh build centos6` would just build
OpenVnmrJ on an existing centos6 without cleaning it, and without
installing or testing it.

The [build_vm.sh](bin/build_vm.sh) script can specify the git branch
and github username.  To build the "development" branch from a github
user "ghuser" on both centos6 and ubuntu14 :

```sh
./bin/build_vm.sh centos6 ubuntu14 --gitname ghuser --branch development 
```

If there are any build errors, you can log into the VM locally through
ssh and inspect the build.log:

```sh
ovjTools $ cd ./vms/centos6
centos6 $ vagrant up
centos6 $ vagrant ssh
[now logged into a shell on the VM...]
vagrant $ cd $ovjBuildDir/logs/
vagrant $ more build*
```

The actual install of OpenVnmrJ (currently) requires graphical user
interaction with the java gui, so to complete the install of
OpenVnmrJ, you have to boot the VM with the GUI enabled and run the
installer manually:

```sh
cd ${OVJ_TOOLS}/vms/centos6
VMGUI=y vagrant up
[open a terminal in the VM]
cd $ovjBuildDir/dvdimageOVJ_.../
./load.nmr
```

### Ubuntu and CentOS

These instructions work for Ubuntu and CentOS (RHEL).  

Make a directory. Let us call it ovjbuild and change into that directory.
Check out the ovjTools repository from GitHub with  

```
mkdir ovjbuild && cd ovjbuild
git clone https://github.com/OpenVnmrJ/ovjTools.git
```
or Download it from the GitHub web site. If you download it, move it to the ovjbuild directory
and unzip it with the commands
```
mv ~/Downloads/ovjTools-master.zip .
unzip ovjTools-master.zip
rm ovjTools-master.zip
```

At the same level as the ovjTools directory, do the following  

```
cp -r ovjTools/bin .
cd bin
```

The bin directory contains several scripts.

The toolChain script installs all the Linux packages required to build
OpenVnmrJ. This includes things like the gcc compiler and assorted libraries and
development header files. You need network access in order to run this script.
The toolChain script only needs to be executed once.

The buildovj script controls the overall build process. By default, it should
work correctly. However, if you wish to customize the build process, edit
this script.  For example, you may decide not to build the Mercury / Inova
version. Or you may decide to move the ovjTools directory to a different location.
The buildovj script is commented to describe various options.

Other options are described in that file but the defaults should be okay. The buildovj
script collects all the options and the makeovj script does all the work. In general,
the makeovj script does three things. The first is to update or clone OpenVnmrJ from git.
The second part compiles everything (doScons=yes). The third part collects files
into the DVD images (buildOVJ=yes).  

If this is the first time you are building OpenVnmrJ on this PC, run the command
```
./toolChain
```
To build OpenVnmrJ, run the command
```
./buildovj
```

During the build, a log file is kept in the ovjbuid/logs directory. You can use a command
such as
```
   tail -f ~/ovjbuild/logs/makeovj.<DATE>
```
to monitor the build.  The whatsin script scans the log file and gives a summary of
the build process.  It identifies any errors that may have occurred.

You can also build  specific programs in the OpenVnmrJ package. For example, to build the
Vnmrbg program, assuming ovjbuild is in your home directory, you can use the following commands
```
cd ~/ovjbuild/OpenVnmrJ/src/vnmrbg
scons
```
Note that on newer operating systems, such as CentOS 8, the scons command may be called scons-3

To compile the java programs, the OVJ_TOOLS env parameter must be set
to point to the ovjTools directory. In a bash shell, the command would be  
```
export OVJ_TOOLS=<path>
```
In a csh, the command would be  
```
setenv OVJ_TOOLS <path>
```
Then, to build vnmrj.jar, use the commands
```
cd ~/ovjbuild/OpenVnmrJ/src/vnmrj
scons
```

### Build artifacts

The buildovj script will compile the entire OVJ package. It will use the OpenVnmrJ/SConstruct file
to  compile the programs in src and place the results in directories at the same level
as the OpenVnmrJ level. The console directory will contain console-specific files.
The vnmr directory will contain files that are generic. The options directory contains
optional software and code that may be optionally installed.  If the buildOVJ and / or
buildOVJMI parameters are set to yes in the buildovj script, additional directories will
be built that are an image of the DVD installer. A log of the build process will be
placed in a logs directory.  The script whatsin in the bin directory will produce a
summary of the content of the build log file.

In summary, before running the buildovj script, your build directory will have bin
and ovjTools directories and optionally, an OpenVnmrJ directory.  If you have previously
run the buildovj script, there will also be console, logs, options, and vnmr directories.
Depending on your selections in the buildovj script, the default DVD images dvdimageOVJ
and dvdimageOVJMI may also be present.  
When the buildovj script is executed, one of the first things it does is remove any
preexisting console, options, vnmr, and dvd image directories.  


## INSTALLATION

Once the buildovj script is complete, and you had selected the buildOVJ and / or buildOVJMI
parameters, you can `cd dvdimageOVJ` or `cd dvdimageOVJMI` and run `./load.nmr` to install a complete
OpenVnmrJ package. For complete details see the [OpenVnmrJ/Install.md](https://github.com/OpenVnmrJ/OpenVnmrJ/blob/master/Install.md) file.


## CODE ORGANIZATION

#### ovjTools Directories

The ovjTools directory contains the following directories and files.   

```
bin            Scripts to build the OpenVnmrJ package
console        programs for spectrometer control
dicom3tools    Used by imaging
fftw           Used by xrecon (imaging program)
fftw_mac       Used by xrecon MacOS version (imaging program)
gsllibs        Used by programs in bin_image
java           Used by all java programs. It is a soft link to the java jdk.
JavaPackages   Used by vjmol and vnmrj
jdk1.6.0_39_64 Java jdk.
JMF-2.1.1e     Used by vnmrj (simplemovie.jar)
junit          Used by apt, probeid, and vjclient
kermit_8.0.211 The kermit program used for field mapping
LICENSE        The Apache II license used by OpenVnmrJ
linux          Some Linux rpm packages
logs           Directory used by VM builds to save log files
NDDS           Used by nvlocki, nvexpproc, nvinfoproc, nvrecvproc, nvsendproc
OSX.md         Build instructions for MacOS
pgsql          Postgress / Locator code
pgsql.osx      Postgress / Locator code for MacOS
tcl            This contains headers and libraries for compiling programs that
               require tcl (Roboproc)
wkhtmltopdf    Used by vnmrj
```


#### OpenVnmrJ Directories

The OpenVnmrJ directory contains the following directories and files.
These files are open-sourced under the Apache II license.

```
Install.md   Installation instructions for OpenVnmrJ
LICENSE      A copy of the Apache II license, under which OpenVnmrJ is licensed.
Notes.txt    Release notes for OpenVnmrJ
README.md    A description of the OpenVnmrJ project
RELEASE.md   A Document describing OpenVnmrJ releases
SConstruct   This is the definition file used by scons. It is similar to Makefile used by
             the make command.
scripts      This contains tools used by scons.
site_scons   Some MacOS specific tools.
src          This contains the source code for OpenVnmrJ. Some of these directories also
             contain a SConstruct file that is used to build / compile that specific
             program.
```

The [OpenVnmrJ/src](https://github.com/OpenVnmrJ/OpenVnmrJ/blob/master/src) directory has a
number of subdirectories. In general, each subdirectory corresponds
to one or more programs that need to be compiled. Some of the subdirectories contain code
that is shared by several programs. Some directories also contain a special sconsPostAction
file. These typically are a shell script with symbolic link commands. For example,
[src/common/maclib](https://github.com/OpenVnmrJ/OpenVnmrJ/blob/master/src/common/maclib) has a
sconsPostAction files which creates aliases of
some of the macros.  The SConstuct must explicitly execute the sconsPostAction. See the
[OpenVnmrJ/SConstruct](https://github.com/OpenVnmrJ/OpenVnmrJ/blob/master/OpenVnmrJ/SConstruct)
file for an example.   

The src directory contains the following subdirectories. Note that the CRAFT included here is
version 1 and is obsolete. See a description of the [new CRAFT here](https://www.openvnmrj.com).


```
3D          Code for compressfid, ft3d, getplane
acqproc     Shared files
admin       VnmrJ installer java program 
aip         Shared files used by vnmrbg. (aip -> advanced image processing)
ampfit      Tools for amplifier linearization (DDR systems)
apt         Auto ProTune java program
apt_32_MMI  Auto ProTune java program for Mercury and Inova systems
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
common      This contains text files that do not need further processing / compiling
craft       CRAFT version 1.
cryo        Cryobay communications java program
cryomon     Cryo monitor communications java program
ddl         Shared files
ddr         Protocols for DDR
dialog      java dialog program
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
kvwacq      Example code for Mercury console programs
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
nvacq       Shared files with DDR console software and example programs
nvexpproc   Expproc for DDR systems
nvinfoproc  Infoproc for DDR systems
nvpsg       PSG for DDR systems
nvpsglib    DDR specific pulse sequences
nvrecvproc  Recvproc for DDR systems
nvsendproc  Sendproc for DDR systems
p11         Files for Part 11 option
passwd      java passwd program
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
vwauto      Example code for Inova automation board
web         Programs to support tablet
xracq       Shared files with VXR console software
xrecon      Imaging reconstruction program (requires GPL license)
yacc        Original yacc tool for helping to make Magical (no longer used)
```

