# Install
First you will need to request a compute node to compile on:
```bash
srun -p intel --time=1-00:00:00 --ntasks=4 --pty bash -l
```

## Environment
Load and unload modules to fullfil requirements
```bash
module unload openmpi
module load intel/2018
```

Since there are Python components to this, then the Python version that is currently active matters.
You could use the Python version directly under miniconda2 (currently the default). Or setup your own conda environment (untested):
```bash
module unload python miniconda2 miniconda3 anaconda2
module load anaconda3
conda create -n NameForNewEnv python=2.7.14
source activate NameForNewEnv
conda install -n NameForNewEnv numpy
```
> Note: The above conda environment is untested, there may be additional Python modules required.

## Download
```bash
mkdir -p /bigdata/$GROUP/shared/src/dftbplus
cd /bigdata/$GROUP/shared/src/dftbplus
git clone https://github.com/dftbplus/dftbplus.git latest
cd latest
git submodule update --init --recursive
```

## Options
Define the compiler and options with a make.arch file.
Since the provided intel make file seems compatible, link to it:
```bash
ln -s sys/make.x86_64-linux-intel make.arch
```

Also set the MPI fortran compiler to mpiifort in `make.arch`:
```diff
12c12,13
< FXX = mpif90
---
> #FXX = mpif90
> FXX = mpiifort
```

Get externals (required for DFTD3 and tests):
```bash
./utils/get_opt_externals ALL
```

Choose the intel compiler for DFTD3 by updating the file `latest/external/dftd3/origin/make.arch`:
```diff
2c2
< ARCH = x86_64-linux-gnu
---
> ARCH = x86_64-linux-intel
```

## Compile
```bash
make INSTALLDIR=/bigdata/$GROUP/shared/pkgs/dftbplus/18.2 WITH_DFTD3=1 WITH_MPI=1
```

## Test
If tests fail, then you may need to remove the socket/H20 tests, like this:
```bash
#sed -i -e '/^sockets\/H2O/d' -e '/^sockets\/diamond/d' test/prog/dftb+/tests
```
The above "solution" was taken from [here](https://github.com/UCL-RITS/rcps-buildscripts/issues/113).

Also you need to have the command `fuser` in your path, so add sbin to your PATH:
```
export PATH=/usr/sbin:$PATH
```

### Single Test
```bash
make test
```

### OMP Test
```bash
make -j2 test TEST_OMP_THREADS=2
```

### MPI Test
```bash
make test TEST_MPI_PROCS=2
```

### OMP and MPI Test (hybrid)
```bash
make test TEST_MPI_PROCS=2 TEST_OMP_THREADS=2
```

## Install
```bash
make install
```
