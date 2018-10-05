# Install

## Download and unpack
```
wget ${URL}
tar -xf boost_1_68_0.tar.gz
cd boost_1_68_0
```

## Configure via bootstrap
Note that without-libraries is set to an empty string, so that all modules are built.
```bash
SOFTNAME=boost
VERSION=1.68.0
./bootstrap.sh --prefix=/opt/linux/centos/7.x/x86_64/pkgs/${SOFTNAME}/${VERSION} --without-libraries=
```

## Edit project-config.jam
```
# MPI
using mpi : /opt/linux/centos/7.x/x86_64/pkgs/openmpi/2.0.1-slurm-16.05.4/bin/mpic++ ;
```

## Build
```
./b2 install | tee install.log
```
