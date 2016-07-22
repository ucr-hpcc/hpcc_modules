# DIYABC

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/
[ -d $SRCDIR/diyabc ] || mkdir $SRCDIR/diyabc
cd $SRCDIR/diyabc
wget -O diyabc-2.1.0-linux64.zip http://www1.montpellier.inra.fr/CBGP/diyabc/download/file.php?id=225
unzip diyabc-2.1.0-linux64.zip
```

## Compile
Not needed, software is pre-compiled.

## Install
```
[ -d $PKGDIR/diyabc ] || mkdir $PKGDIR/diyabc
mkdir $PKGDIR/diyabc/2.1.0
cp -r diyabc-2.1.0-linux64/* $PKGDIR/diyabc/2.1.0/
```

## Cleanup
Nothing special.
