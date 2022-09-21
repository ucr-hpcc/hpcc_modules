# Installation
```
VERSION=1.14
NAME=libdeflate
BASE=/opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION
curl -L -O https://github.com/ebiggers/libdeflate/archive/refs/tags/v${VERSION}.tar.gz
tar zxf v${VERSION}.tar.gz
cd ${NAME}-${VERSION}
make PREFIX=$BASE install
```
