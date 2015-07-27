# Install
## Download
Download source:

## Prep
Edit file:
```
vim src/Align/find-tandem.cc
    #include <getopt.h>
```

Load prerequisites:
```
module load blat
module load mummer
```

## Compile
Compile with qmake path for GUI builds:
```
./configure --with-qmake-qt4=/usr/lib64/qt4/bin/qmake --prefix=/opt/linux/centos/7.x/x86_64/pkgs/amos/3.1.0
```
