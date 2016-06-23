# RiboTaper

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/ribotaper
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/ribotaper
[ -d $SRCDIR ] || mkdir $SRCDIR
cd $SRCDIR
wget https://ohlerlab.mdc-berlin.de/files/RiboTaper/RiboTaper_v1.3.tar.gz
tar -zxvf RiboTaper_v1.3.tar.gz
cd Version_1.3/scripts
for i in *; do sed -i 's/bin\/Rscript/bin\/env\ Rscript/g' "$i"; done
cd ..
```

## Compile
Not needed.

## Install
```
[ -d $PKGDIR ] || mkdir $PKGDIR
mkdir $PKGDIR/1.3
cp -R * $PKGDIR/1.3/
```

## Cleanup
Nothing special.
