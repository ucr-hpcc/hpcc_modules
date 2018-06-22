#Install
The instructions I followed are here:
https://xconfigure.readthedocs.io/en/latest/cp2k/README/
The above instructions also cover how to install libint, libxc, and elpa.

Note: The binaries for CP2K are built, and live, directly under the src tree under the 'exe' directory.

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
#!/bin/bash -l

#SBATCH --ntasks=16
#SBATCH --cpus-per-task=4
##SBATCH --mem=100g
#SBATCH --mem-per-cpu=1024
#SBATCH --time=2:00:00
#SBATCH -p short

module unload openmpi
module load intel/2017.4.196
source $(which compilervars.sh) intel64
source $(which mklvars.sh) intel64

CP2K_HOME='/opt/linux/centos/7.x/x86_64/src/CP2K/cp2k.git/cp2k'

mpirun -np 16 \
-genv I_MPI_PIN_DOMAIN=auto -genv I_MPI_PIN_ORDER=bunch \
-genv KMP_AFFINITY=compact,granularity=fine,1 \
-genv OMP_NUM_THREADS=4 \
$CP2K_HOME/exe/Linux-x86-64-intelx/cp2k.psmp \
$CP2K_HOME/tests/QS/benchmark/H2O-64.inp
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

