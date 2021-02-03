# Install SST

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

