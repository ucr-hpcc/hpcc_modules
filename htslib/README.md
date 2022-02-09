# Install

```
mkdir -p src/h/htslib
pushd src/h/htslib
VERSION=1.14
NAME=htslib
curl -L -O https://github.com/samtools/$NAME/releases/download/$VERSION/$NAME-${VERSION}.tar.bz2
tar jxf $NAME-${VERSION}.tar.bz2
cd $NAME-$VERSION
BASE=/opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION

module load libdeflate
export CPPFLAGS="-I/opt/linux/centos/8.x/x86_64/pkgs/libdeflate/1.10/include"
export LDFLAGS="-L /opt/linux/centos/8.x/x86_64/pkgs/libdeflate/1.10/lib -ldeflate"
./configure --prefix=$BASE --enable-s3 --enable-libcurl  --with-libdeflate
make install

```
