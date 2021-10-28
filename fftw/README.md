# FFTW

## Install Prep

Load modules:
```bash
module purge
module load base/gcc/8.3.0
```

Export compilers:
```bash
export CC=$(which gcc)
export CXX=$(which g++)
export FC=$(which gfortran)
```

## Configure Flags

Not compatible with OpenMP:
```bash
--with-combined-threads \
```

Precision:
```bash
--enable-single --enable-float \
--enable-double \ 
--enable-long-double \ 
```

CPU Arch:
```bash
--enable-sse2 \
--enable-avx \
```

## Single Precision (a.k.a Float)

Clean up:
```bash
make distclean || make clean || echo "Nothing to clean"
```

Configure build and install float/single (libfftw3f)
```bash
./configure \
--prefix ${HPCC_MODULES}/${PKGNAME}/${VERSION} \
--enable-mpi \
--enable-openmp \
--enable-threads \
--enable-shared \
--enable-sse2 \
--enable-single && \
make -j 2 && \
make install
```

## Double Precision

Clean up:
```bash
make distclean || make clean || echo "Nothing to clean"
```

Configure build and install double (libfftw3):
```bash
./configure \
--prefix ${HPCC_MODULES}/${PKGNAME}/${VERSION} \
--enable-mpi \
--enable-openmp \
--enable-threads \
--enable-shared \
--enable-sse2 \
--enable-avx \
--enable-double && \
make -j 2 && \
make install
```
