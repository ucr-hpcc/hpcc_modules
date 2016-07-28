# beagle

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/beagle
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/beagle
[ -d $SRCDIR ] || mkdir $SRCDIR
cd $SRCDIR
wget https://faculty.washington.edu/browning/beagle/beagle.23Jul16.fb0.jar
```

## Compile
Not needed, this software is a single jar file.

## Install
```
[ -d $PKGDIR ] || mkdir $PKGDIR
mkdir $PKGDIR/4.1
mkdir $PKGDIR/4.1/lib
cp $SRCDIR/beagle.23Jul16.fb0.jar $PKGDIR/4.1/lib/
```

## Cleanup
It's probably a good idea to setup a bash script to use as an alias for the jar.
```
mkdir $PKGDIR/4.1/bin
vim $PKGDIR/4.1/bin/beagle
```
Below is an example script for the beagle executable script:
```
#!/bin/bash

java -jar $(dirname $0)/../lib/beagle.23Jul16.fb0.jar $@
```
Lastly, don't forget to change permissions for the script...
```
chmod +x $PKGDIR/4.1/bin/beagle
```
