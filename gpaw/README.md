# Basics
First you must request a compute node to do the work
```bash
srun -p short --ntasks=4 --pty bash -l
```
After you have been allocated a node then you may proceed with the installation and tests.

# Intel Compiler
## Modules
Unload other Pythons and MPI libraries:

```bash
module unload python miniconda2 miniconda3 anaconda2 anaconda3 openmpi
module load intel/2018
module load libfabric/1.9.1
module load libxc/4.2.3_intel
```

## IntelPython
Download intelpython from [https://software.intel.com/en-us/distribution-for-python/choose-download/linux](https://software.intel.com/en-us/distribution-for-python/choose-download/linux)

```bash
# Update the tar to the cluster, then unpack it
tar -xf l_pythoni3_p_2020.0.014.tar.gz

# Move it to a version directory
mkdir ~/bigdata/software/intelpython3/
mv intelpython3 ~/bigdata/software/intelpython3/2020.0.014
```

Then run `./setup_intel_python.sh`, which installs everything in the same directory.
After that add the `~/bigdata/software/intelpython3/2020.0.014/bin` directory to your PATH:

```
export PATH=~/bigdata/software/intelpython3/2020.0.014/bin:$PATH
```

Then initalize conda:

```bash
conda init
conda activate base
```

Logout and back in, or just reload your bashrc, like so:

```bash
source ~/.bashrc
```

## Install GPAW
### Download
Get GPAW source:

```bash
mkdir ~/bigdata/src && cd ~/bigdata/src
wget https://pypi.org/packages/source/g/gpaw/gpaw-20.1.0.tar.gz
tar -xf gpaw-20.1.0.tar.gz
cd gpaw-20.1.0
```

### Configure
Create file `siteconfig.py` with the following contents:
```python
compiler = 'icc'
mpicompiler = '/opt/linux/centos/7.x/x86_64/pkgs/intel/2018/compilers_and_libraries_2018.0.128/linux/mpi/intel64/bin/mpiicc'
mpilinker = '/opt/linux/centos/7.x/x86_64/pkgs/intel/2018/compilers_and_libraries_2018.0.128/linux/mpi/intel64/bin/mpiicc'

scalapack = True

library_dirs += ['/opt/linux/centos/7.x/x86_64/pkgs/intel/2018/compilers_and_libraries_2018.0.128/linux/mkl/lib/intel64_lin','/rhome/jhayes/bigdata/software/intelpython3/2020.0.014/lib']
libraries = ['mkl_intel_lp64' ,'mkl_sequential' ,'mkl_core',
             'mkl_lapack95_lp64',
             'mkl_scalapack_lp64', 'mkl_blacs_intelmpi_lp64',
             'pthread','python3.7m'
             ]

libraries += ['xc']
# change this to your installation directory
LIBXCDIR='/opt/linux/centos/7.x/x86_64/pkgs/libxc/4.2.3_intel/'
library_dirs += [LIBXCDIR + 'lib']
include_dirs += [LIBXCDIR + 'include']

define_macros += [('GPAW_NO_UNDERSCORE_CBLACS', '1')]
define_macros += [('GPAW_NO_UNDERSCORE_CSCALAPACK', '1')]
define_macros += [("GPAW_ASYNC",1)]
define_macros += [("GPAW_MPI2",1)]
```

### Build
Then build and install gpaw:

```bash
python setup.py install --prefix='' --home=~/bigdata/software/intelpython3/2020.0.014
```

## Pre-Running
Unload things we don't want:

```bash
module unload python miniconda2 miniconda3 anaconda2 anaconda3 openmpi
```

Then we need to load the base intelpython conda:
```
conda activate base
```

Not sure why `conda` does not already do this, but we need to add the intelpython shared object files to our `LD_LIBRARY_PATH`, like this:

```
export LD_LIBRARY_PATH=~/bigdata/software/intelpython3/2020.0.014/lib:$LD_LIBRARY_PATH
```

Load software that we do want:

```bash
module load intel/2018
module load libfabric/1.9.1
module load libxc/4.2.3_intel
```

Since we installed `gpaw` into a custom location we need to add this to our `PYTHONPATH`, like so:

```bash
export PYTHONPATH=~/bigdata/software/intelpython3/2020.0.014/lib/python:$PYTHONPATH
```

Add both of these `export` lines to the end of your `~/.bashrc` file to make these changes permanent.

## Notes
We ended up using an externally compiled libfabric, not the intel internal version of libfabric.
However, I am making a note of it for future reference.
It can be enabled when `mpivars.sh` script is executed with the `-ofi_internal` argument. Or when `I_MPI_OFI_LIBRARY_INTERNAL` is set to a positive value.


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
export GPAW_SETUP_PATH=/bigdata/$GROUP/shared/gpaw-setups
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

# Sharing
To share this software, assuming you did not change your default permission, all that is required is to actiave the conda environment:
```bash
# Unload wrong pythons 
module unload python miniconda2 miniconda3 anaconda2

# Load correct python
module load anaconda3

# Set conda paths
export CONDA_ENVS_PATH=/bigdata/$GROUP/shared/.conda/envs
export CONDA_PKGS_DIRS=/bigdata/$GROUP/shared/.conda/pkgs

# Activate gpaw environment
source activate gpaw
```
