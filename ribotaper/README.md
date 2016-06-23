# RiboTaper

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/ribotaper
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/ribotaper
[ -d $SRCDIR ] || mkdir $SRCDIR
cd $SRCDIR
wget https://ohlerlab.mdc-berlin.de/files/RiboTaper/RiboTaper_Version_1.3.1.tar.gz
tar -zxvf RiboTaper_Version_1.3.1.tar.gz
cd ribotaper-1.3.1
[ -d $PKGDIR ] || mkdir $PKGDIR
mkdir $PKGDIR/1.3.1
./configure --prefix=/$PKGDIR/1.3.1
```

## Compile
```
make
```

## Install
```
make install
```

## Cleanup
Nothing special.
