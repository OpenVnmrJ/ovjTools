
To make libtcl8.4.so and tclsh
Unzip tcl8420-src.zip
cd tcl8.4.20/unix
./configure --prefix=/vnmr --enable-64bit
make

To make libtk8.4.so
Unzip tk8420-src.zip
cd tk8.4.20/unix
./configure --prefix=/vnmr --enable-64bit
make

The libBLT was obtained from nmrPipe/nmrbin.linux212_64/lib
It was renamed from libBLT24.so to libBLT24.so.8.4
