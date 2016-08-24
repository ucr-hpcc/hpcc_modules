# SMALT
SMALT - aligns DNA sequencing reads with a reference genome.
http://www.sanger.ac.uk/science/tools/smalt-0
## Prep
```
curl -O http://downloads.sourceforge.net/project/smalt/smalt-0.7.6-static.tar.gz
```

## Compile
```
tar zxf smalt-0.7.6-static.tar.gz
cd smalt-0.7.6
./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/smalt/0.7.6
make
## Install
```
make install
```

## Cleanup
Nothing special.
