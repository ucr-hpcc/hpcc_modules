#Install
The instructions I followed are here:
https://xconfigure.readthedocs.io/en/latest/cp2k/README/
The above instructions also cover how to install libint, libxc, and elpa.

After all the dependencies were compiled I used this line to compile cp2k:
```bash
export ROOT_SRC=/opt/linux/centos/7.x/x86_64/src/CP2K;
make ARCH=Linux-x86-64-intelx \
VERSION=psmp \
LIBINTROOT=$ROOT_SRC/libint/default-hsw \
LIBXCROOT=$ROOT_SRC/libxc/default-hsw \
ELPAROOT=$ROOT_SRC/elpa/default-hsw \
AVX=2
```

Then I ran a basic MPI-Hybrid sanity test on the cluster:
```bash
wget http://biocluster.ucr.edu/~jhayes/cp2k/cp2k_run.sh
sbatch cp2k_run.sh
```

The I appended an include flag (-I) to the intelx arch file /opt/linux/centos/7.x/x86_64/src/CP2K/cp2k/arch/Linux-x86-64-intelx.arch:
```bash
# Line 143
FCFLAGS   = -free -fpp -heap-arrays -I/opt/linux/centos/7.x/x86_64/src/CP2K/cp2k/obj/Linux-x86-64-intelx/psmp
```

# Regression test
```
export INCLUDE=/opt/linux/centos/7.x/x86_64/src/CP2K/cp2k/obj/Linux-x86-64-intelx/psmp;
export ROOT_SRC=/opt/linux/centos/7.x/x86_64/src/CP2K;
make ARCH=Linux-x86-64-intelx \
VERSION=psmp \
LIBINTROOT=$ROOT_SRC/libint/default-hsw \
LIBXCROOT=$ROOT_SRC/libxc/default-hsw \
ELPAROOT=$ROOT_SRC/elpa/default-hsw/ \
AVX=2 \
test 
```

