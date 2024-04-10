# cp2k

## Install

These steps are for 2024.1 and should be adapted for newer versions.

Install steps are summarized from:
https://github.com/cp2k/cp2k/blob/master/INSTALL.md

1. Download release from https://github.com/cp2k/cp2k/releases/
2. Extract it
3. Follow steps below to compile

```
tar xvf cp2k-2024.1.tar.bz2 -C 2024.1
cd 2024.1/cp2k-2024.1
module load gcc/12
mpi_implementation=openmpi target_cpu=generic maxtasks=$(nproc) source ./arch/Linux-gnu-x86_64.psmp gcc/12 openmpi
source ./arch/Linux-gnu-x86_64
make -j $(nproc) ARCH=Linux-gnu-x86_64 VERSION=psmp
```
