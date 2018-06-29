# Install
## Notes
* Download, extract, build all source trees for dependencies, as well as for CP2K, all from within the same directory. Set an environemnt variable to reference this directory, like so:
  ```bash
  export ROOT_SRC=/path/to/parent/directory
  ```
* When compiling dependencies always choose Haswell CPU architecture `hsw` (ie. `./configure-libint-hsw.sh`,`./configure-libxc-hsw.sh`,`./configure-elpa-hsw.sh`)
* CP2K are built/installed they will live directly under the src tree in the 'exe' directory.

## Compile
First, you need to request an interactive job:
```bash
srun -p short -c 4 --pty bash -l
```

Next, follow the installtion guides for all the dependencies (libint, libxc, and elpa) outlined [here](https://xconfigure.readthedocs.io/en/latest/cp2k/README/).


After all the dependencies are compiled use this line to compile cp2k:
```bash
export ROOT_SRC=/path/to/parent/directory #Remember to set this;
make -j 4 ARCH=Linux-x86-64-intelx \
VERSION=psmp \
LIBINTROOT=$ROOT_SRC/libint/default-hsw \
LIBXCROOT=$ROOT_SRC/libxc/default-hsw \
ELPAROOT=$ROOT_SRC/elpa/default-hsw \
AVX=2
```
## Test
Then I ran a basic MPI-Hybrid sanity test on the cluster:
```bash
#!/bin/bash -l

#SBATCH --ntasks=16
#SBATCH --cpus-per-task=4
##SBATCH --mem=100g
#SBATCH --mem-per-cpu=1024
#SBATCH --time=2:00:00
#SBATCH -p short
#SBATCH --switches=1

module unload openmpi
module load intel/2017.4.196
source $(which compilervars.sh) intel64
source $(which mklvars.sh) intel64

# Set CP2K home directory
export ROOT_SRC=/path/to/parent/directory #Remember to set this;
CP2K_HOME="$ROOT_SRC/cp2k/"

mpirun -np 16 \
-genv I_MPI_PIN_DOMAIN=auto -genv I_MPI_PIN_ORDER=bunch \
-genv KMP_AFFINITY=compact,granularity=fine,1 \
-genv OMP_NUM_THREADS=4 \
$CP2K_HOME/exe/Linux-x86-64-intelx/cp2k.psmp \
$CP2K_HOME/tests/QS/benchmark/H2O-64.inp
```

# Regression test
## Compile again
Then I appended an include flag (-I) to the intelx arch file /opt/linux/centos/7.x/x86_64/src/CP2K/cp2k/arch/Linux-x86-64-intelx.arch:
```bash
# Line 143
FCFLAGS   = -free -fpp -heap-arrays -I/opt/linux/centos/7.x/x86_64/src/CP2K/cp2k/obj/Linux-x86-64-intelx/psmp
```

## Test again
```
export INCLUDE=/opt/linux/centos/7.x/x86_64/src/CP2K/cp2k/obj/Linux-x86-64-intelx/psmp;
export ROOT_SRC #Remember to set this;
make -j 4 ARCH=Linux-x86-64-intelx \
VERSION=psmp \
LIBINTROOT=$ROOT_SRC/libint/default-hsw \
LIBXCROOT=$ROOT_SRC/libxc/default-hsw \
ELPAROOT=$ROOT_SRC/elpa/default-hsw/ \
AVX=2 \
test 
```

