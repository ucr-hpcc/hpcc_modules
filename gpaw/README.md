# Basics
First you must request a compute node to do the work. Note that an `intel` node is required if compiling with `intel` compilers.

With intel:
```bash
srun -p short -C intel --ntasks=4 --pty bash -l
```

With older AMD:
```bash
srun -p short -C amd --ntasks=4 --pty bash -l
```

After you have been allocated a node then you may proceed with the installation and tests.

# Intel Compiler

## Modules

Unload other Pythons and MPI libraries:

```bash
module purge
module load slurm
module load oneapi/2021.1.0.2659_suite
```

## IntelPython

IntelPython now comes with oneapi as well as all the other Intel compilers for free. So downloading the IntelPython separatly is no longer required.
However if you still wish to do so you can use the following link:
Download intelpython from [https://software.intel.com/en-us/distribution-for-python/choose-download/linux](https://software.intel.com/en-us/distribution-for-python/choose-download/linux)


Once you have loaded `openapi`, then initalize conda:

```bash
export PATH=/opt/linux/centos/7.x/x86_64/pkgs/oneAPI/BaseKit_p_2021.1.0.2659/intelpython/python3.7/condabin:$PATH
conda_init
conda activate base
```

## Install GPAW

### Download

Get GPAW source:

```bash
mkdir ~/bigdata/src && cd ~/bigdata/src
wget https://pypi.org/packages/source/g/gpaw/gpaw-21.6.0.tar.gz
tar -xf gpawgpaw-21.6.0.tar.gz
cd gpaw-21.6.0
```

### Configure

Create file `siteconfig.py` with the following contents:
```python
compiler = 'icc'
mpicompiler = '/opt/linux/centos/7.x/x86_64/pkgs/oneAPI/BaseKit_p_2021.1.0.2659/mpi/2021.1.1/bin/mpiicc'
mpilinker = '/opt/linux/centos/7.x/x86_64/pkgs/oneAPI/BaseKit_p_2021.1.0.2659/mpi/2021.1.1/bin/mpiicc'

scalapack = True

library_dirs += [
                 '/opt/linux/centos/7.x/x86_64/pkgs/oneAPI/BaseKit_p_2021.1.0.2659/mkl/2021.1.1/lib/intel64',
                 '/opt/linux/centos/7.x/x86_64/pkgs/oneAPI/BaseKit_p_2021.1.0.2659/intelpython/python3.7/lib'
                 ]
                 
libraries = [
             'mkl_intel_lp64' ,'mkl_sequential' ,'mkl_core',
             'mkl_lapack95_lp64',
             'mkl_scalapack_lp64', 'mkl_blacs_intelmpi_lp64',
             'pthread','python3.7m'
            ]
```

### Build
Then build and install gpaw:

```bash
python setup.py install --user
```

## Pre-Running

Unload things we don't want:

```bash
module purge
module load oneapi/2021.1.0.2659_suite
export PATH=/opt/linux/centos/7.x/x86_64/pkgs/oneAPI/BaseKit_p_2021.1.0.2659/intelpython/python3.7/condabin:$PATH
conda_init
```

Then we need to activate the base intelpython conda:
```
conda activate base
```

Load software that we do want:

```bash
module load slurm
```

You can add all of the above lines to the end of your `~/.bashrc` file to make these changes persistant.

# GCC Compiler
# Install

## Load Conda
```bash
module unload python miniconda2 miniconda3 anaconda2
module load anaconda3
```
## Conda Paths
Conda can get very large, so it is best to place the installs under a shared bigdata space.
```
export CONDA_ENVS_PATH=/bigdata/$GROUP/shared/.conda/envs
export CONDA_PKGS_DIRS=/bigdata/$GROUP/shared/.conda/pkgs
```
The above export lines should also be placed in `~/.bashrc` file, thus making them permanent.

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
> include_dirs = ['/opt/linux/centos/7.x/x86_64/pkgs/libxc/4.2.3/include','/bigdata/YOUR_GROUP_NAME/shared/.conda/envs/gpaw/lib/python3.4/site-packages/numpy/core/include']
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

## Compile and Install
```bash
python3 setup.py install
```

# Datasets
Install datasets
```bash
gpaw install-data /bigdata/$GROUP/shared/gpaw-setups
```

# Tests

## Non- Parallel

Run single threaded tests
```
gpaw test
```

## Parallel

Run MPI tests

```bash
gpaw -P 4 test
```
