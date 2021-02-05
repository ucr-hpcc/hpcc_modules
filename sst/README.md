# Install SST

Make sure the Python version you choose to compile against has headers (ie. `Python.h`) as well as shared libraries (ie. `libpython3.6m.so.1.0`).

## Core

The Python.h file was never found, so I hacked `configure` (line 19247) to allways pass the Python.h search:

```make
nsst_check_python_happy="yes"
```

Then added the CPPFLAGS and CFLAGS to include the `Python.h` parent directory (see `Set Vars` section below).

### Purge everything

Make sure we have a clean slate:

```bash
module purge
```

### Load conda-init function

The user pkgadmin needs to load this function, all other users should have it already:

```bash
source ~/.bashrc
```

### Load python3

```bash
module unload python miniconda2 miniconda3 anaconda2 anaconda3
module load python/3.6.0
```

### Load mpi and slurm

```bash
module load slurm/19.05.0 openmpi/4.0.1-slurm-19.05.0
```

### Set Vars

```bash
export CC=$(which gcc)
export CXX=$(which g++)
export MPICC=$(which mpicc)
export MPICXX=$(which mpicxx)

export CPPFLAGS='-I/opt/linux/centos/7.x/x86_64/pkgs/python/3.6.0/include -I/opt/linux/centos/7.x/x86_64/pkgs/python/3.6.0/include/python3.6m'
export CFLAGS='-I/opt/linux/centos/7.x/x86_64/pkgs/python/3.6.0/include -I/opt/linux/centos/7.x/x86_64/pkgs/python/3.6.0/include/python3.6m'
```

### Run configure

```bash
./configure \
--prefix=/opt/linux/centos/7.x/x86_64/pkgs/sstcore/10.1.0 \
--with-python=/opt/linux/centos/7.x/x86_64/pkgs/python/3.6.0/bin/python-config
```
## Elements

Building `elemenets` was similar to `core`, although elements required Python shared libraries, core did not.

### Purge everything

```bash
module purge
```

### Load conda-init function

```bash
source ~/.bashrc
```

### Load python3

```bash
module unload python miniconda2 miniconda3 anaconda2 anaconda3
module load python/3.6.0
```

### Load mpi and slurm

```bash
module load slurm/19.05.0 openmpi/4.0.1-slurm-19.05.0
```

### Load SST core

```bash
module load sst/10.1.0
export SST_CORE_HOME=$(dirname $(dirname /opt/linux/centos/7.x/x86_64/pkgs/sstcore/10.1.0/bin/sst))
```

### Set compilers

```
export CC=$(which gcc)
export CXX=$(which g++)
export MPICC=$(which mpicc)
export MPICXX=$(which mpicxx)
```

### Set ELEMENTS vars

```bash
export SST_ELEMENTS_HOME=/opt/linux/centos/7.x/x86_64/pkgs/sstelements/10.1.0
export SST_ELEMENTS_ROOT=/opt/linux/centos/7.x/x86_64/src/sst/sst-elements-library-10.1.0
```

### Run configure
```bash
./configure \
--prefix=${SST_ELEMENTS_HOME} \
--with-sst-core=${SST_CORE_HOME}
```

### Build
```bash
make
```

### Install

```bash
make install
```
