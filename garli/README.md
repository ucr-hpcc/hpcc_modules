# GARLI

## Prep
GARLI requires the [NEXUS Class Library (ncl)](https://github.com/mtholder/ncl), 
this guide assumes [ncl version 2.1.21](../ncl/) is already installed and 
configured.
Alternatively, the build_garli.sh script can retrieve the latest version from 
svn during the build process as done in using the instructions below.
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs
cd $SRCDIR
git clone https://github.com/skepner/garli.git
cd garli/garli/tags/2.1-release
[ -d $PKGDIR/garli ] || mkdir $PKGDIR/garli
[ -d $PKGDIR/garli/2.1 ] || mkdir $PKGDIR/garli/2.1
```

## Compile
```
./build_garli.sh --ncl-svn
```

## Install
```
cp -r bin/ doc/ example/ tests/ $PKGDIR/garli/2.1/
```

## Cleanup
```
Nothing special.
```
