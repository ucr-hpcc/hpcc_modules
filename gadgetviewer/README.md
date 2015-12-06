# GadgetViewer

## Prep
I had to install gtk2, gtk3 was not compatible.
```
yum install gtk2 gtk2-devel

cd $SRCDIR
wget http://astro.dur.ac.uk/~jch/gadgetviewer/gadgetviewer-1.0.6.tar.gz
tar -xf gadgetviewer-1.0.6.tar.gz
cd gadgetviewer-1.0.6
```

## Compile
```
./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/gadgetviewer/1.0.6
make
```

## Install
```
make install
```

## Cleanup

