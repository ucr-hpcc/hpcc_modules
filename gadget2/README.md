# Installing Gadget2

## Prerequisites 

To install Gadget 2.0.7, some libraries are needed:
  1. OpenMPI (openmpi/4.1.2_slurm-21.08.5)
  2. gsl (gsl-2.5-1.el8.x86_64, gsl-devel-2.5-1.el8.x86_64)
  3. fftw (fftw/2.1.5)
  4. hdf5 (hdf5/1.12.1)

### OpenMPI

OpenMPI can be loaded through `module load openmpi/4.1.2_slurm-21.08.5`.

### gsl

GSL is now installed via RPMs under the default locations.
Alternatively, gsl can be downloaded from https://ftp.gnu.org/gnu/gsl/gsl-1.9.tar.gz.
To compile, first run `./configure`, then run `make`.

### fftw

FFTW can be loaded through `module load fftw/2.1.5`.

### hdf5

HDF5 can be loaded through `module load hdf5/1.12.1`.

## Configure

Before compiling Gadget2, some changes must be made to the `Gadget2/Makefile`.
Add the following blocks to this `Makefile`:

```Makefile
# Ensure this is the only SYSTYPE selected near the top
SYSTYPE="UCR_HPCC_GCC"

# Ensure this block is placed near the other systems
ifeq ($(SYSTYPE),"UCR_HPCC_GCC")
CC       =  mpicc                                                                      
OPTIMIZE =  -O3 -Wall -m64 -DH5_USE_16_API
GSL_INCL =  -I/usr/include/gsl                                                   
GSL_LIBS =  -L/usr/lib64
FFTW_INCL=  -I/opt/linux/rocky/8.x/x86_64/pkgs/fftw/2.1.5/include
FFTW_LIBS=  -L/opt/linux/rocky/8.x/x86_64/pkgs/fftw/2.1.5/lib
MPICHLIB =  -L/opt/linux/rocky/8.x/x86_64/pkgs/openmpi/4.1.2_slurm-21.08.5/lib -lmpi
HDF5INCL =  -I/opt/linux/rocky/8.x/x86_64/pkgs/hdf5/1.12.1/include
HDF5LIB  =  -L/opt/linux/rocky/8.x/x86_64/pkgs/hdf5/1.12.1/lib -lhdf5 -lz
endif
```

# Build

In order to compile, just run `make`.

# Install

Move the source directory to install location:

```
mkdir $HPCC_MODULES/gadget2
mv $HPCC_MODULES/../src/g/gadget2/Gadget-2.0.7 $HPCC_MODULES/gadget2/2.0.7
```

