# BUSCO
Note this is now just a git checkout
 - https://gitlab.com/ezlab/busco.git
## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/busco
cd $SRCDIR
wget http://busco.ezlab.org/files/BUSCO_v1.2.tar.gz
tar -zxvf BUSCO_v1.2.tar.gz
cd BUSCO_v1.2
[ -d $PKGDIR ] || mkdir $PKGDIR
mkdir $PKGDIR/1.2
```

## Compile
Not needed.

## Install
```
mkdir $PKGDIR/1.2/bin
cp BUSCO_v1.2.py $PKGDIR/1.2/bin/BUSCO.py
cd $PKGDIR/1.2/bin
chmod +x BUSCO.py
ln -s BUSCO.py busco.py
```

## Cleanup
```
cd $SRCDIR
[ -d busco ] || mkdir busco
mv BUSCO_v1.2/ BUSCO_v1.2.tar.gz busco/
```
