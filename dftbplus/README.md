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
Create working directory and go to it:
```bash
mkdir -p /bigdata/$GROUP/shared/src/dftbplus
cd /bigdata/$GROUP/shared/src/dftbplus
```

Use wget to get a specific release:
```bash
wget https://github.com/dftbplus/dftbplus/archive/18.2.tar.gz
tar -xf dftbplus-18.2.tar.xz
cd dftbplus-18.2
```

Or, get latest source code via git:
```bash
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

Set the MPI fortran compiler to mpiifort in the following files:
```bash
sed -i 's/mpif90/mpiifort/g' ./make.arch
sed -i 's/mpif90/mpiifort/g' ./external/scalapackfx/origin/make.arch.template
sed -i 's/mpif90/mpiifort/g' ./external/mpifx/origin/make.arch.template
```

Get externals (required for DFTD3 and tests):
```bash
./utils/get_opt_externals ALL
```

Choose the intel compiler for DFTD3 by updating the file `external/dftd3/origin/make.arch`:
```diff
2c2
< ARCH = x86_64-linux-gnu
---
> ARCH = x86_64-linux-intel
```

## Compile
```bash
export INSTALLDIR=/bigdata/$GROUP/shared/pkgs/dftbplus/18.2
make INSTALLDIR=$PREFIX WITH_DFTD3=1 WITH_MPI=1 WITH_SOCKETS=0
```

## Test
You need to have the command `fuser` in your path, so add sbin to your PATH:

```
export PATH=/usr/sbin:$PATH
```

Also, make sure that you have `WITH_MPI` flag for testing, or the tests will run in serial mode with an MPI compiled binary, which will result in failures.

### Single Test
```bash
make test WITH_MPI=1 WITH_SOCKETS=0
```

### OMP Test
```bash
make -j2 test WITH_MPI=1 TEST_OMP_THREADS=2 WITH_SOCKETS=0
```

### MPI Test
```bash
make test WITH_MPI=1 TEST_MPI_PROCS=2 WITH_SOCKETS=0
```

### OMP and MPI Test (hybrid)
```bash
make test TEST_MPI_PROCS=2 TEST_OMP_THREADS=2 WITH_MPI=1 WITH_SOCKETS=0
```

## Install
```bash
make INSTALLDIR=$PREFIX install
```
