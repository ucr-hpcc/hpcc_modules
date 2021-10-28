
# Install

## Download

download and untar from https://github.com/QEF/q-e/releases

## Compile

Overall it seems that the make files are very good at auto detecting libraries and dependencies.
This can be a good thing, but also difficult to customize.

### GCC 8.3.0

The latest version of QE (6.7+) requires a newer GCC compiler (C11 support?), thus we now use GCC 8.3.0 to compile.

#### CMake

Load modules:
```bash
module purge
module load base/gcc/8.3.0
module load slurm/19.05.0
module load openblas/0.3.17_gcc-8.3.0
module load fftw/3.3.5_gcc-8.3.0
module load cmake git/2.33.1
```

Set verions:
```bash
VERSION="6.8_gcc-8.3.0_clean"
export CC=$(which gcc)
export CXX=$(which g++)
export FC=$(which gfortran)
```

Export paths:
```bash
export FFTW3_ROOT=${HPCC_MODULES}/fftw/3.3.5_gcc-8.3.0
export FFTW3_INCLUDE_DIRS=${FFTW3_ROOT}/include
export BLAS_ROOT=${HPCC_MODULES}/openblas/0.3.17_gcc-8.3.0
export BLAS_INCLUDE_DIRS=${BLAS_ROOT}/include
```

Set Flags:
```bash
export FCFLAGS=${FFTW3_INCLUDE_DIRS}:${BLAS_INCLUDE_DIRS}
export CPPFLAGS=${FFTW3_INCLUDE_DIRS}:${BLAS_INCLUDE_DIRS}
```

Create new build directory:
```bash
rm -rf ./build
mkdir ./build
cd ./build
```

Configure:
```bash
cmake \
-DCMAKE_INSTALL_PREFIX=${HPCC_MODULES}/espresso/${VERSION} \
-DCMAKE_Fortran_COMPILER=mpif90 \
-DCMAKE_C_COMPILER=mpicc \
-DFFTW3_ROOT=${FFTW3_ROOT} \
-DFFTW3_INCLUDE_DIRS=${FFTW3_INCLUDE_DIRS} \
..
```

Build `all` and `epw` targets:
```bash
ALL=$(grep -P "^all\s+:"  Makefile | cut -d: -f2)
make $ALL epw
```

Install:
```bash
make install
```

#### Configure Script

Using the `configure` script stopped working well, try using the `CMake` method instead.
However if you insist, here is how we used to use the `configure` script:

```bash
module purge
module load base/gcc/8.3.0
module load slurm/19.05.0
module load cmake

VERSION="6.8_gcc-8.3.0"
export CC=$(which gcc)
export CXX=$(which g++)
export FC=$(which gfortran)

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/espresso/${VERSION} && \
make all && \
make install
```

### Intel 2018

Last compiled with QE 6.7, but should still work the same way with newer OneAPI and QE 6.8+:

```
# Unload everything
module purge

# Load intel compilers
module load intel/2018

# Set version
VERSION=6.7_intel-2018

CC=mpiicc
FC=mpiifort

# Configure with defaults
./configure --enable-openmp --prefix=/opt/linux/centos/7.x/x86_64/pkgs/espresso/${VERSION} && \
make all && \
make install
```

### GCC 4.8 (OLD)

This is now deprecated since newer version of QE do not support our native GCC.

We had to specify default paths of libs so that intel mkl was overwritten

```bash
./configure --enable-openmp --prefix=/opt/linux/centos/7.x/x86_64/pkgs/espresso/5.3.0 BLAS_LIBS="-L/usr/lib64 -lblas" LAPACK_LIBS="-L/usr/lib64 -llapack" FFT_LIBS="-L/usr/lib64 -lfftw" && \
make all && \
make install
```
