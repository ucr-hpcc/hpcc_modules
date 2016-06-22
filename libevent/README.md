# libevent

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/libevent
cd $SRCDIR
wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
tar -zxvf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
mkdir $PKGDIR $PKGDIR/2.0.22
```

## Compile
```
./configure --prefix=$PKGDIR/2.0.22 --disable-shared
make
```

## Install
```
make install
```

## Cleanup
```
cd $SRCDIR
[ -d libevent ] || mkdir libevent
mv libevent-2.0.22-stable/ libevent-2.0.22-stable.tar.gz libevent/
```
