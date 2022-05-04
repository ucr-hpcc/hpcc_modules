# Dedalus

> Note: Since numpy>=1.20.0 is required, then Python>=3.8 is also necessary.

## Set Vars
Set software name and version variables:

```bash
SOFT_NAME='dedalus'
SOFT_VER='79bbb80'
```

## Load Modules

Other modules could get in the way (ie. `miniconda3`), so purge everything and only load the necesities:

```bash
module purge
module load slurm/21.08.5
module load openmpi/4.1.2_slurm-21.08.5
module load fftw/3.3.10
```

## Add Python 

Since we need a native python>=3.8 for numpy>=1.20.0, then manually added this to `PATH`:

```bash
export PATH=$HPCC_MODULES/python/3.10.4/bin:$PATH
export LD_LIBRARY_PATH=$HPCC_MODULES/python/3.10.4/lib:$LD_LIBRARY_PATH
```

## Install Path

Define install path for Dedalus:

```bash
DEDALUS_HOME=$HPCC_MODULES/$SOFT_NAME/$SOFT_VER
```

Admins should use the $HPCC_MODULES variable to install under `/opt`, however other users can use any path they choose.

## VirtualEnv

Create Python virtual environment for Dedalus:

```bash
virtualenv $DEDALUS_HOME
```

## Activate

Now we need to activate the newly created dedalus `virtualenv`:

```bash
source $DEDALUS_HOME/bin/activate
```

## Set Dependencies

Ensure all the following dependencies are defined:

```bash
export FFTW_PATH=$HPCC_MODULES/fftw/3.3.10/
export MPI_PATH=$HPCC_MODULES/openmpi/4.1.2_slurm-21.08.5/
export CC=$(which mpicc)
export CXX=$(which mpicxx)
export LDSHARED="mpicc -shared"  # Need to add flag, otherwise undefined symbols
```

<!---
Only needed for intel compilers or MKL
export FFTW_STATIC=1
-->

## Install Dedalus

Download source code for Dedalus:

```bash
git@github.com:DedalusProject/dedalus.git
```

Install Dedalus into newly created `virutalenv`:

```bash
pip install --no-cache .
```

