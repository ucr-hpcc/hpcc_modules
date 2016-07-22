# canu

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/
[ -d $SRCDIR/canu ] || mkdir $SRCDIR/canu
cd $SRCDIR/canu
wget https://github.com/marbl/canu/releases/download/v1.3/canu-1.3.Linux-amd64.tar.bz2
tar -xvf canu-1.3.Linux-amd64.tar.bz2
```

## Compile
Not needed, software is pre-compiled.

## Install
```
[ -d $PKGDIR/canu ] || mkdir $PKGDIR/canu
mkdir $PKGDIR/canu/1.3
cp -r canu-1.3/Linux-amd64/* canu-1.3/README.md $PKGDIR/canu/1.3/
```

## Cleanup
Nothing special.
