# Version 4.1.2

Install seems to be similar to version 4.5.8.

I also had to add `sys/types.h` to `src/misc/gmtdigitize.c`.

It was also necessary to delete several `*.a` files that `ar` thought were "ambiguous".
After removing them, and running a clean confugre and make, the files were re-created in the proper format.

And lastly, I disabled `Matlab` and `X11` extensions:

```bash
./configure --prefix=$HPCC_MODULES/gmt/4.1.2 --disable-mex --disable-xgrid && make && make install
```

# Version 4.5.8

## install
```bash

su - pkgadmin
cd /opt/linux/centos/7.x/x86_64/src

wget ftp://ftp.soest.hawaii.edu/gmt/legacy/gmt-4.5.8.tar.bz2

bzip2 -d gmt-4.5.8.tar.bz2

tar -xvf gmt-4.5.8.tar

cd gmt-4.5.8


#!/bin/bash

# Notes (probably specific to this version)
# 1) add "#include <sys/types.h>" to top of src/misc/gmtdigitize.c
# 2) make must be run as single process, i.e. no -jX where X>1

INSTALLDIR=/opt/linux/centos/7.x/x86_64/pkgs/gmt/4.5.8

# Exit on error and echo commands
set -ex

mkdir -p $INSTALLDIR

module load netcdf
module load octave

./configure --enable-netcdf --enable-octave --prefix=$INSTALLDIR

make all
make install-all

wget ftp://ftp.soest.hawaii.edu/gshhg/legacy/gshhs-2.1.1-coast.tar.bz2
bzip2 -d gshhs-2.1.1-coast.tar.bz2
tar -xvf gshhs-2.1.1-coast.tar
cp -r share/coast/ $INSTALLDIR/share/.
```

# Version 5

## install
```bash

su - pkgadmin
cd /opt/linux/centos/7.x/x86_64/src
wget http://gmt.soest.hawaii.edu/files/download?name=gmt-5.4.4-src.tar.gz
tar -zxvf gmt-5.4.4-src.tar.gz
cd gmt-5.4.4

#!/bin/bash

INSTALLDIR=/opt/linux/centos/7.x/x86_64/pkgs/gmt/4.5.8

# Exit on error and echo commands
set -ex

mkdir -p $INSTALLDIR

module load netcdf
module load octave

wget http://gmt.soest.hawaii.edu/files/download?name=gshhg-gmt-2.3.7.tar.gz
tar -zxvf gshhg-gmt-2.3.7.tar.gz
export GSHHG_ROOT=/opt/linux/centos/7.x/x86_64/src/gmt-5.4.4/gshhg-gmt-2.3.7

./configure --enable-netcdf --enable-octave --prefix=$INSTALLDIR

make all
make install-all
```

