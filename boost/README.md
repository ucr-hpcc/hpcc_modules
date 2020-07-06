# Install

## Request Node

Compiling on a node is faster then a login node, so lets request 4 CPUs and 10GB of RAM for 2 hours:

```bash
srun -p short -c 4 --mem=10g --time=2:00:00 --pty bash -l
```

## Download and unpack

```bash
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

```vim
# MPI
using mpi : /opt/linux/centos/7.x/x86_64/pkgs/openmpi/4.0.1-slurm-19.05.0/bin/mpic++ ;
```

## Build

```bash
./b2 install | tee install.log
```
