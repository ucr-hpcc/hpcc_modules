# Installing Gadget2

## Prerequisites 
To install Gadget 2.0.7, some libraries are needed:
1. OpenMPI (openmpi/4.0.1-slurm-19.05.0)
2. gsl (gsl/1.9)
3. fftw (fftw 2.1.5)
4. hdf5 (hdf5/1.10.1)

### OpenMPI
OpenMPI can be loaded through ```module load openmpi/4.0.1-slurm-19.05.0```

### gsl
gsl can be downloaded from https://ftp.gnu.org/gnu/gsl/gsl-1.9.tar.gz.
To compile, first run ```./configure```, then run `make`.

### fftw
fftw can be downloaded from http://www.fftw.org/fftw-2.1.5.tar.gz.
To compile, first run ```./configure```, then run `make`.

### hdf5
hdf5 can be loaded through ```module load hdf5/1.10.1```

## Install
Before compiling Gadget2, some changes must be made to the ```Makefile```. 

First, the line ```OPT   +=  -DH5_USE_16_API``` must be added. It should be in the existing ```Makefile``` and can be uncommented.

Next, the compiler needs to know where the libraries that have been installed are located. To do this, the line ```SYSTYPE="MPA"``` can be changed to an arbitrary name. In this case, it is ```mycomputer```. Then, a new computer can be defined as follows: 
```
ifeq ($(SYSTYPE),"mycomputer")
CC       =  mpicc   
OPTIMIZE =  -O3 -Wall
GSL_INCL =  -I/usr/local/include
GSL_LIBS =  -L/usr/local/lib
FFTW_INCL=  -I/usr/local/include
FFTW_LIBS=  -L/usr/local/lib
MPICHLIB =  -L/usr/local/lib
HDF5INCL =  -I/usr/lib/x86_64-linux-gnu/hdf5/serial/include
HDF5LIB  =  -L/usr/lib/x86_64-linux-gnu/hdf5/serial/lib -lhdf5 -lz
endif
```
The libraries and their paths should be adjusted accordingly. Then, Gadget2 can be compiled through ```make```.
