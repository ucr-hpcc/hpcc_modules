# FREEC
Control-FREEC: Copy number and genotype annotation in whole genome and whole exome sequencing data
https://github.com/BoevaLab/FREEC
## Prep
```
wget https://github.com/BoevaLab/FREEC/archive/v9.5.tar.gz
tar zxf v9.5.tar.gz
```

## Compile

```
cd FREEC-9.5/src
make
```

## Install
```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/freec/9.5/bin
rsync -a src/freec /opt/linux/centos/7.x/x86_64/pkgs/freec/9.5/bin
rsync -a data scripts /opt/linux/centos/7.x/x86_64/pkgs/freec/9.5
```
## Cleanup
Nothing special.
