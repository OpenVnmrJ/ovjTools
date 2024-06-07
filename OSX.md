
# Building OpenVnmrJ on MacOS

Follow these instructions for building OpenVnmrJ on MacOS. If you just want to use OpenVnmrJ on MacOS, just download a [release](https://github.com/OpenVnmrJ/OpenVnmrJ/releases).  

## Download and install

You will need to download and install:  

- The Xcode command line tools. These include the clang compiler and git. From a termianl, if you run git and clang and they
  do not exist, MacOS will provide instructions for installing these tools. The command typically is
```
     xcode-select --install
```

- The scons compiler tool. This controls the compilation of OpenVnmrJ. If it does not exist, one method is to use
  "brew" to install it. To instal brew, from a terminal, run
```
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
  After brew is installed, run
```
      brew install scons
```

- X-Window support. Two packages are required. The XQuartz package can be downloaded from
  https://www.xquartz.org. The package name is XQuartz-2.8.5.pkg. The OpenMotif package
  can be installed with brew. Installation of brew is described above for installing scons.
  Run the command

```
      brew install openmotif
```

- The java development environment. The open-source version of java for MacOS may be obtained from https://jdk.java.net.
  Download either the macOS/x64 version for Intel based Macs or macOS/AArch64 for Silicon Macs. To install the Intel version
  of, for example, the JDK 22.0.1 release, unpack the java package with the commands

```
    gunzip openjdk-22.0.1_macos-x64_bin.tar.gz
    tar xvf openjdk-22.0.1_macos-x64_bin.tar
```

  For the Silcon version, unpack the java package with

```
    gunzip openjdk-22.0.1_macos-aarch64_bin.tar.gz
    tar xvf openjdk-22.0.1_macos-aarch64_bin.tar
```

  In both cases, move the jdk-22.0.1.jdk directory with the command

```
    sudo mv jdk-22.0.1.jdk /Library/Java/JavaVirtualMachines  
```


## Build on MacOS

Make a directory. Let us call it ovjbuild and change into that directory.
Note that the ovjbuild directory should not be a subdirectory of a "Documents"
directory. Apple has instituted some security features on "Documents" directories
that cause the OpenVnmrJ build to fail.

Check out the ovjTools repository from GitHub with  

```
mkdir ovjbuild && cd ovjbuild
git clone https://github.com/OpenVnmrJ/ovjTools.git
```

On MacOS, OpenVnmrJ is installed via a .pkg file. A third-party tool, Packages.dmg, is used to construct this .pkg
  file. Using the Finder, navigate to ovjTools and double-click on Packages.dmg. Follow the instructions to install it.

At the same level as the ovjTools directory, do the following  

```
cp -r ovjTools/bin .
cd bin
```

The buildovj script controls the overall build process. By default, it should
work correctly. However, if you wish to customize the build process, edit
this script.  For example, you may decide not to build the Mercury / Inova
version. To build OpenVnmrJ, run the command
```
./buildovj
```


During the build, a log file is kept in the ovjbuid/logs directory. You can use a command
such as
```
   tail -f ~/ovjbuild/logs/makeovjlog
```
to monitor the build.  The whatsin script scans the log file and gives a summary of
the build process.  It identifies any errors that may have occurred. The OpenVnmrJ
installer will be at ovjbuild/dvdimageOVJ/OpenVnmrJ.pkg

Note: If installing OpenVnmrJ for the first time, you may need to reboot the Mac before
OpenVnmrJ will function.


### Data station only

MacOS version  of OpenVnmrJ is a data station only and cannot control a spectrometer host.  

### Not included

- NMRPipe is not included in this distribution but can be downloaded with the ovjGetpipe script
- The complete VnmrJ 4.2 fidlib is not included in this distribution but can be downloaded with
  the ovjGetFidlib script
- The complete VnmrJ 4.2 manual set is not included in this distribution but can be downloaded with
  the ovjGetManuals script
 
