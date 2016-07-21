# Installation
Make sure you have static libraries installed for hd5f then proceed with these instructions:
> [blasr repo](https://github.com/PacificBiosciences/blasr "blasr repo")

## 5.1
Might be better to get a newer version of git so that it supports the "-C" flag, which would reduce the following steps:
```
cd /opt/linux/centos/7.x/x86_64/pkgs/blasr
git clone git@github.com:PacificBiosciences/ blasr.git 5.2
cd 5.2
git pull -u origin master && git submodule update --init --recursive
./configure.py --no-pbbam --shared
make configure-submodule
make build-submodule
make
```
