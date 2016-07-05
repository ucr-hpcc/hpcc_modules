# Circos

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/circos
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/circos
[ -d $SRCDIR ] || mkdir $SRCDIR
cd $SRCDIR
wget http://circos.ca/distribution/circos-0.69.tgz
tar -zxvf circos-0.69.tgz
```
#### Check that required Perl modules are installed
```
cd circos-0.69/bin
./circos -modules
```
#### Install any missing modules

## Compile
Not needed, this software is a collection of Perl scripts.

## Install
```
cp -r $SRCDIR/circos-0.69/ $PKGDIR/0.69/
```

## Cleanup
Nothing special.
