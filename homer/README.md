# homer 

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/homer
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/homer
[ -d $SRCDIR ] || mkdir -p $SRCDIR
cd $SRCDIR
wget http://homer.salk.edu/homer/configureHomer.pl
```

## Compile
Not needed, software is a collection of perl scripts that are downloaded via 
the configureHomer.pl script.

## Install
```
[ -d $PKGDIR ] || mkdir -p $PKGDIR
mkdir $PKGDIR/4.8
mv configureHomer.pl $PKGDIR/4.8
perl $PKGDIR/4.8/configureHomer.pl -install
```
Note: Check output of configureHomer.pl script for missing software packages.

## Cleanup
Nothing special.
