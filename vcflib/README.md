# vcflib

## Prep
vcflib developers don't seem to keep track of versions very well, so for now 
compiling is done using the date of compile as the version number... Keep that 
in mind in the instructions below compile date in instructions is 2016-07-19.

If a previous version of vcflib is present in the src directory, it may be a 
good idea to create a backup tar.gz of the snapshot to avoid having to dig 
through the commit history in order to find the last-compiled snapshot (in the 
event that a revert is necessary).
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/
[ -d $SRCDIR/vcflib ] || mkdir $SRCDIR/vcflib
cd $SRCDIR/vcflib
git clone --recursive https://github.com/vcflib/vcflib.git vcflib-git
cd vcflib-git
```

## Compile
```
make openmp
```

## Install
```
[ -d $PKGDIR/vcflib ] || mkdir $PKGDIR/vcflib
mkdir $PKGDIR/vcflib/20160719
cp -r bin/ $PKGDIR/vcflib/20160719/
```

## Cleanup
```
Nothing special, although it may be a good idea to include a README with the 
last commit hash in the $PKGDIR/vcflib/{compile date}/ directory for reference.
```
