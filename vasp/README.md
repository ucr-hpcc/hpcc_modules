# Dependencies
## GNU
There were a few dependencies:
    1. liblapack.a
    2. librefblas.a
    3. libtmglib.a
These can be built from the lapack source.
I downloaded the SRPM from CentOS Vault:
    `wget http://vault.centos.org/7.1.1503/os/Source/SPackages/lapack-3.4.2-4.el7.src.rpm`

After installing this SRPM, it dumps all the files under you home directory:
    `/root/rpmbuild`
Within this directory cd into SOURCES.
Once there, do the following:
```
make blaslib
make
```
It should automatically create the other 2 libraries (assuming that the corresponding makefile lines are uncommented).

I also built scalapack.

## Intel
I had to build the fftw3xf interface from the Intel's MKL.

```bash
cd ${MKLROOT}/interfaces/fftw3xf
make libintel64
```

## Build
Download patches from: https://cms.mpi.univie.ac.at/wiki/index.php/Installing_VASP#Patches

Apply patches:
```
tar -xf vasp.5.4.1.tar.gz
cd vasp-5.4.1
patch -p0 patch.5.4.1.08072015
patch -p1 patch.5.4.1.27082015
patch -p0 patch.5.4.1.06112015
```
Link makefile, make edits to makefile and then build:
```
ln -s arch/makefile.include.linux_gfortran makefile.include
# OR
#ln -s arch/makefile.include.linux_intel makefile.include

#Set LIBDIR, INCS, OBJECTS, and possibly many other things, refer to example makefiles below
vim makefile.include 

# Build
make
```

### Install
Set your install path to the location of where you want Vasp to be installed, then do the following:
```
mkdir -p ${INSTALL_PATH}/vasp
mv vasp-5.4.1 ${INSTALL_PATH}/vasp/5.4.1
```

## Example makefiles
### GNU
```
# Precompiler options
CPP_OPTIONS= -DMPI -DHOST=\"IFC91_ompi\" -DIFC \
             -DCACHE_SIZE=4000 -Davoidalloc \
             -DMPI_BLOCK=8000 -DscaLAPACK -Duse_collective \
             -DnoAugXCmeta -Duse_bse_te \
             -Duse_shmem -Dtbdyn

CPP        = gcc -E -P -C $*$(FUFFIX) >$*$(SUFFIX) $(CPP_OPTIONS)

FC         = mpif90
FCL        = mpif90

FREE       = -ffree-form -ffree-line-length-none

FFLAGS     = 
OFLAG      = -O2
OFLAG_IN   = $(OFLAG)
DEBUG      = -O0

LIBDIR     = /opt/linux/centos/7.x/x86_64/pkgs/lapack/3.4.2/lib
BLAS       = -L$(LIBDIR) -lrefblas
LAPACK     = -L$(LIBDIR) -ltmglib -llapack
BLACS      = 
SCALAPACK  = -L/opt/linux/centos/7.x/x86_64/pkgs/scalapack/2.0.2/lib -lscalapack $(BLACS)

OBJECTS    = fftmpiw.o fftmpi_map.o  fftw3d.o  fft3dlib.o \
             /usr/lib64/libfftw3.a
INCS       =-I/usr/include

LLIBS      = $(SCALAPACK) $(LAPACK) $(BLAS)

OBJECTS_O1 += fft3dfurth.o fftw3d.o fftmpi.o fftmpiw.o chi.o
OBJECTS_O2 += fft3dlib.o

# For what used to be vasp.5.lib
CPP_LIB    = $(CPP)
FC_LIB     = $(FC) 
CC_LIB     = gcc
CFLAGS_LIB = -O
FFLAGS_LIB = -O1
FREE_LIB   = $(FREE)

OBJECTS_LIB= linpack_double.o getshmem.o

# Normally no need to change this
SRCDIR     = ../../src
BINDIR     = ../../bin
```
### Intel

First Load proper intel module:
```bash
module load intel/2017.4.196
```

Then compile the Intel wrapper for fftw3xf (likely already done):
```bash
cd /opt/linux/centos/7.x/x86_64/pkgs/intel/mkl/2017.2.174/compilers_and_libraries_2017.4.196/linux/mkl/interfaces/fftw3xf
make libintel64
```

Then you can proceed with the using the following makefile.include for Intel:
```make
# Precompiler options
CPP_OPTIONS= -DMPI -DHOST=\"IFC91_ompi\" -DIFC \
             -DCACHE_SIZE=4000 -DPGF90 -Davoidalloc \
             -DMPI_BLOCK=8000 -DscaLAPACK -Duse_collective \
             -Duse_bse_te -Duse_shmem -Dtbdyn

CPP        = fpp -f_com=no -free -w0  $*$(FUFFIX) $*$(SUFFIX) $(CPP_OPTIONS)

FC         = mpiifort
FCL        = mpiifort -mkl=sequential

FREE       = -free -names lowercase

FFLAGS     = -assume byterecl
OFLAG      = -O2
OFLAG_IN   = $(OFLAG)
DEBUG      = -O0

MKLROOT=/opt/linux/centos/7.x/x86_64/pkgs/intel/mkl/2017.2.174/mkl/
SCALAPACK  = /opt/linux/centos/7.x/x86_64/pkgs/intel/mkl/2017.2.174/compilers_and_libraries_2017.4.196/linux/mkl/lib/intel64_lin/libmkl_scalapack_lp64.a $(BLACS)

MKL_PATH   = $(MKLROOT)/lib/intel64
BLAS       =
LAPACK     =
BLACS      = -lmkl_blacs_intelmpi_lp64
SCALAPACK  = $(MKL_PATH)/libmkl_scalapack_lp64.a $(BLACS)

OBJECTS    = fftmpiw.o fftmpi_map.o fftw3d.o fft3dlib.o \
             $(MKLROOT)/interfaces/fftw3xf/libfftw3xf_intel.a
INCS       =-I$(MKLROOT)/include/fftw

LLIBS      = $(SCALAPACK) $(LAPACK) $(BLAS)

OBJECTS_O1 += fft3dfurth.o fftw3d.o fftmpi.o fftmpiw.o
OBJECTS_O2 += fft3dlib.o

# For what used to be vasp.5.lib
CPP_LIB    = $(CPP)
FC_LIB     = $(FC)
CC_LIB     = icc
CFLAGS_LIB = -O
FFLAGS_LIB = -O1
FREE_LIB   = $(FREE)

OBJECTS_LIB= linpack_double.o getshmem.o

# Normally no need to change this
SRCDIR     = ../../src
BINDIR     = ../../bin
```
