# Dependencies
There were a few dependencies:
    1. liblapack.a
    2. librefblas.a
    3. libtmglib.a
These can be built from the lapack source.
I downloaded the SRPM from CentOS Vault:
    `wget http://vault.centos.org/7.1.1503/os/Source/SPackages/lapack-3.4.2-4.el7.src.rpm`

After installing this SRPM, it dumps all the files under you home directory:
    `/root/rpmbuild`
Within this directory cd into SOURCES.
Once there, do the following:
```
make blaslib
make
```
It should automatically create the other 2 libraries (assuming that the corresponding makefile lines are uncommented).

I also built scalapack.

## Build
```
tar -xf vasp.5.4.1.tar.gz
cd vasp-5.4.1
ln -s arch/makefile.include.linux_gfortran makefile.include
vim makefile.include #Set LIBDIR
make
```

### Install
```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/vasp
mv vasp-5.4.1 /opt/linux/centos/7.x/x86_64/pkgs/vasp/5.4.1
```
