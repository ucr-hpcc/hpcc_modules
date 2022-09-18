# Install

```
mkdir -p src/s/samtools
pushd src/s/samtools
VERSION=1.16
NAME=samtools
curl -L -O https://github.com/samtools/$NAME/releases/download/$VERSION/$NAME-${VERSION}.tar.bz2
tar jxf $NAME-${VERSION}.tar.bz2
cd $NAME-$VERSION
BASE=/opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION
module load htslib
./configure --prefix=$BASE --with-htslib=$(dirname $(which bgzip))  --with-ncurses
make install
```
