# weblogo (seqlogo)

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/weblogo
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/weblogo
[ -d $SRCDIR ] || mkdir -p $SRCDIR
cd $SRCDIR
wget http://weblogo.berkeley.edu/release/weblogo.2.8.2.tar.gz
```

## Compile
Not needed, this software is pre-compiled.

## Install
```
[ -d $PKGDIR ] || mkdir -p $PKGDIR
mkdir $PKGDIR/2.8.2
tar -xvf weblogo.2.8.2.tar.gz
mv weblogo/* $PKGDIR/2.8.2
```

## Cleanup
Nothing special.
