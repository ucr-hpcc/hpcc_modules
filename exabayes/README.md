# Exabayes installation notes

## Download Exabayes and extract

```
mkdir /opt/linux/centos/7.x/x86_64/src/exabayes
cd /opt/linux/centos/7.x/x86_64/src/exabayes
wget https://sco.h-its.org/exelixis/resource/download/software/exabayes-1.5.tar.gz
tar -zxvf exabayes-1.5.tar.gz
```

## Configure, Make, Make Install

```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5
cd /opt/linux/centos/7.x/x86_64/src/exabayes/exabayes-1.5

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi --enable-mpi
make
make install
```

## Testing


```
```
