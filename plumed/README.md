# Plumed

Since this version of plumed is intended to be used with CP2K, some of the dependencies are from the CP2K toolchain.

## Load Software

Load needed software from module system and CP2K toolchain:

```bash
module purge
module load extra GCC/8.3.0
module load python/3.4.3
module load xdrfile/1.1.4_gcc-8.3.0

source $HPCC_MODULES/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/setup
```

## Define Libraries

```bash
LDFLAGS="-L${HPCC_MODULES}/../easybuild/pkgs/GCCcore/8.3.0/lib64 -lstdc++ \
-L$HPCC_MODULES/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/mpich-3.3/lib -lmpi \
-L${HPCC_MODULES}/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/openblas-0.3.6/lib -lopenblas \
-L${HPCC_MODULES}/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/fftw-3.3.8/lib -lfftw3 \
-L${HPCC_MODULES}/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/gsl-2.5/lib -lgsl \
-L${HPCC_MODULES}/zlib/1.2.11_gcc-8.3.0/lib -lz \
-L${HPCC_MODULES}/xdrfile/1.1.4_gcc-8.3.0/lib -lxdrfile"

CPPFLAGS="-I${HPCC_MODULES}/../easybuild/pkgs/GCCcore/8.3.0/include \
-I$HPCC_MODULES/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/mpich-3.3/include \
-I${HPCC_MODULES}/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/openblas-0.3.6/include \
-I${HPCC_MODULES}/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/fftw-3.3.8/include \
-I${HPCC_MODULES}/cp2k/7.1_gcc-8.3.0/tools/toolchain/install/gsl-2.5/include \
-I${HPCC_MODULES}/zlib/1.2.11_gcc-8.3.0/include \
-I${HPCC_MODULES}/xdrfile/1.1.4_gcc-8.3.0/include"

MPICXX=$(which mpic++)
```

## Clean old build files

```bash
make distclean
```

# Configure

Run configure with auto searching turned off, and manually set flags/paths for compiling:

```bash
./configure \
--enable-libsearch=no \
--prefix=/opt/linux/centos/7.x/x86_64/pkgs/plumed/2.6.1_gcc-8.3.0 \
--enable-mpi \
--enable-fftw \
--enable-shared \
--enable-static-patch \
--enable-external-lapack \
--enable-external-blas \
LDFLAGS="${LDFLAGS}" \
CPPFLAGS="${CPPFLAGS}" \
MPICXX="${MPICXX}" \
CXX="${MPICXX}" \
LIBS="${LDFLAGS}"
```

# Build

Build using generated make files and use all cores available:

```
make -j
```

## Make docs

This is optional and requires proper doxygen version installed:

```bash
make doc
```

# Install

Place all compiled binaries and libraries under their final resting place:

```
make install
```

