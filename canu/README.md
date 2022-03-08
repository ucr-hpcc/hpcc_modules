# canu

## Prep
```
SRCDIR=/opt/linux/centos/8.x/x86_64/src
PKGDIR=/opt/linux/centos/8.x/x86_64/pkgs/
[ -d $SRCDIR/canu ] || mkdir $SRCDIR/canu
cd $SRCDIR/canu
https://github.com/marbl/canu/releases/download/v2.2/canu-2.2.Linux-amd64.tar.xz
xz -d canu-2.2.Linux-amd64.tar.xz
tar xf canu-2.2.Linux-amd64.tar
```

## Compile
Not needed, software is pre-compiled.

## Install
```
mkdir -p $PKGDIR/canu/2.2
rsync -a canu-2.2/* $PKGDIR/canu/2.2/
```

## Cleanup
Nothing special.
