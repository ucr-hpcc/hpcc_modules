# ShortStack

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/ShortStack
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/ShortStack
[ -d $SRCDIR ] || mkdir $SRCDIR
cd $SRCDIR
wget https://github.com/MikeAxtell/ShortStack/archive/v3.4.tar.gz
tar -zxvf v3.4.tar.gz
```
#### Make sure required dependencies are installed
* perl
* samtools
* bowtie
* bowtie-build
* gzip
* viennarna
    * RNAfold 

## Compile
Not needed.

## Install
```
[ -d $PKGDIR ] || mkdir $PKGDIR
[ -d $PKGDIR/ShortStack ] || mkdir $PKGDIR/ShortStack
cp -r $SRCDIR/ShortStack-3.4/* $PKGDIR/3.4/
```

## Cleanup
Nothing special.
