For filtering nanopore long reads

Installed and built from https://github.com/rrwick/Filtlong

```
cd /opt/linux/centos/8.x/x86_64/src/f
mkdir -p filtlong
cd filtlong
wget https://github.com/rrwick/Filtlong/archive/refs/tags/v0.2.1.tar.gz
tar zxf v0.2.1.tar.gz
cd Filtlong-0.2.1
make -j
BASE=/opt/linux/centos/8.x/x86_64/pkg/filtlong/0.2.1/
mkdir -p $BASE $BASE/bin
rsync -a bin/filtlong $BASE/bin
rsync -a scripts misc $BASE
```
