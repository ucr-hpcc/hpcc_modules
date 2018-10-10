# Basics
First you must request a compute node to do the work
```bash
srun -p short --ntasks=4 --pty bash -l
```
After you have been allocated a node then you may proceed with the installation and tests.

# Install

## Load Conda
```bash
module unload python miniconda2 miniconda3 anaconda2
module load anaconda3
```

## Create Environment
```bash
conda create -n gpaw
source activate gpaw
conda install -n gpaw python=3.4 pip
```

## Install Dependencies
```bash
conda install -n gpaw numpy 
conda install -n gpaw scipy
conda install -n gpaw -c conda-forge ase
```

## Download Source
```bash
mkdir src
cd src/
wget wget https://pypi.org/packages/source/g/gpaw/gpaw-1.4.0.tar.gz
tar -xf gpaw-1.4.0.tar.gz
cd gpaw-1.4.0
```

## Custom settings
```bash
vim customize.py
```

Here is the following patch for the relevant changes:
```diff
31,34c31,34
< # compiler = 'gcc'
< # mpicompiler = 'mpicc'  # use None if you don't want to build a gpaw-python
< # mpilinker = 'mpicc'
< # platform_id = ''
---
> compiler = 'gcc'
> mpicompiler = 'mpicc'  # use None if you don't want to build a gpaw-python
> mpilinker = 'mpicc'
> platform_id = 'hpcc_centos7'
36a37,40
> libraries = ['blas', 'lapack']
> library_dirs = ['/lib64']
> include_dirs = ['/opt/linux/centos/7.x/x86_64/pkgs/libxc/4.2.3/include','/rhome/jhayes/bigdata/.conda/envs/gpaw/lib/python3.4/site-packages/numpy/core/include']
>
52,53c56,57
< if 0:
<     xc = '/home/user/libxc-4.0.4/'
---
> if 1:
>     xc = '/opt/linux/centos/7.x/x86_64/pkgs/libxc/4.2.3/'
61c65
<     xc = '/home/user/libxc-4.0.4/'
---
>     xc = '/opt/linux/centos/7.x/x86_64/pkgs/libxc/4.2.3/'
```

## Compile amd Install
```bash
python3 setup.py install
```

# Datasets
Install datasets
```bash
gpaw install-data ~/bigdata/gpaw-setups
```

# Tests
## Non- Parallel
Run single threaded tests
```
export GPAW_SETUP_PATH=~/bigdata/gpaw-setups
export mpi_warn_on_fork=0
gpaw test
```
OR
```bash
gpaw test -j 4
```

## Parallel
Run MPI tests
```bash
mpiexec -np 4 gpaw-python -m gpaw test
```

This does NOT work for some reason, even though it should be equivalent to above.
```bash
gpaw -P 4 test
```
