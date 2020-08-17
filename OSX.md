# Building OpenVnmrJ on OS X

Follow these instructions for building OpenVnmrJ on OS X. If you just want to use OpenVnmrJ on OS X, just download a [release](https://github.com/OpenVnmrJ/OpenVnmrJ/releases).  

## Download and install

You will need to download and install:  
- A modern C compiler (clang 7.3.0 is latest, for OS X 10.11 El Capitan) See below for installing the Xcode command line tools or GCC 5.8.
  - You likely need to install Xcode command line tools even if using GCC because system headers, make, ld, and other utilities need to be installed.  
- A Java JDK, You must install the __JDK__, not JRE
  - Java 8 works OK in testing
  - The java link in ovjTools is ignored and the system Java is used for the OS X build 
  - Use Java 6 from [Apple](https://support.apple.com/kb/dl1572?locale=en_US) OR  
  - Java 8 JDK from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- Sconstruct from [SourceForge](http://iweb.dl.sourceforge.net/project/scons/scons/2.4.1/scons-2.4.1.tar.gz)
- PostgreSQL 8.4.11 from [
- ovjTools from [GitHub](https://github.com/OpenVnmrJ/ovjTools)
- OpenVnmrJ source from [GitHub](https://github.com/OpenVnmrJ/OpenVnmrJ)

If you want to build all source files, then you need
- gfortran from [GitHub](https://github.com/timburrow/gcc-5.2-OSX/releases/download/1.0/gcc5.2-osx-usrlocal.tar.bz2)
- Object files are provided for FORTRAN code, so FORTRAN compiling is not necessary

## Install Xcode command line tools
Install system headers and clang (C compiler) and check it is installed.
```
xcode-select --install
cc -v
> Apple LLVM version 7.3.0 (clang-703.0.31)
> Target: x86_64-apple-darwin15.4.0
```

## Install gcc [Optional]

Clang can be used to build OpenVnmrJ on OS X.

gfortran can be used to build the FORTRAN components for DOSY.

```
curl -Os https://github.com/timburrow/gcc-5.2-OSX/releases/download/1.0/gcc5.2-osx-usrlocal.tar.bz2
sudo tar xf gcc5.2-osx-usrlocal.tar.bz2 -C /
```
*Note that gcc compilation will usually fail, so remove or rename gcc*

## Install Java 6
Install Java 6 from the installer from Apple. After doing this, make Java 6 the default JDK, then check the version  
```
export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export PATH="$(/usr/libexec/java_home -v 1.6)/bin":"${PATH}"
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v1.6)' >> ~/.bash_profile
echo 'export PATH="$(/usr/libexec/java_home -v1.6)/bin":"${PATH}"' >> ~/.bash_profile
javac -version
> javac 1.6.0_65
```

You may use Java 8, see below.  

## Install Java 8
Install Java 8 from the installer from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). After installing, make Java 8 the default JDK, then check the version.  
```
echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)' >> ~/.bash_profile
export PATH="$(/usr/libexec/java_home -v 1.8)/bin":"${PATH}"
javac -version
> javac 1.8.0_92
```

## install SConstruct

Download and then build:
```
curl -Os http://pilotfiber.dl.sourceforge.net/project/scons/scons/2.5.0/scons-2.5.0.tar.gz
tar -xzvf scons-2.4.0.tar.gz
cd scons-2.5.0
sudo python setup.py install
```
*Scons 2.5 requires Python version 2.7 or 3. OS X El Capitan has python 2.7.10*  

## Install PostgreSQL

For compatibility, PostgreSQL 8.4.22 was used from [http://www.postgresql.org](http://www.postgresql.org/ftp/source/v8.4.22/)  
Compilation was done using clang. Install either Xcode or the command line tools or GCC
```
curl -Os "https://ftp.postgresql.org/pub/source/v8.4.22/postgresql-8.4.22.tar.bz2"
tar jxf postgresql-8.4.22.tar.bz2
export CC=clang; export CFLAGS=-O3
./configure --with-libraries=/vnmr/lib --prefix=/vnmr/pgsql --without-readline
make -j2
make install
```

## gcc v clang;

The build has been tested with a 64-bit build using clang, gcc, and gfortran.  


## Java 8

If is possible to build using either Java 6 or Java 8. 

If you notice any bugs under Java 8; please file a bug report and make a pull request!

## Caveats

### Data station only

OS X is a data station only and cannot control a spectrometer host.  

### Not included

- There are no example FIDs in the OpenVnmrJ distribution
   - You need to get them from VnmrJ 4.2
   - They may be available from the University of Oregon in the future.  
- NMRPipe is not included in this distribution but can be downloaded with the ovjGetpipe script
 
