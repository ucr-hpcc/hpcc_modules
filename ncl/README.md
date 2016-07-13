# ncl (NEXUS Class Library)
*Required library for GARLI*

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs
[ -d $SRCDIR/ncl ] || mkdir $SRCDIR/ncl
cd $SRCDIR/ncl
git clone https://github.com/mtholder/ncl.git
cd ncl
sh bootstrap.sh
```

## Compile
```
env CPPFLAGS=-DNCL_CONST_FUNCS ./configure --prefix=$PKGDIR/ncl/2.1.21 --disable-shared
make
make check
```

## Install
```
make install
```

## Cleanup
```
Nothing special
```
