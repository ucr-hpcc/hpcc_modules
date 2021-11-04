# CASTEP

Due to code/math optimizations, it is best to compile multiple copies to ensure the best peformance on each node type.

## GCC 8.3.0

Set basic install vars:
```bash
SOFTNAME=castep
VERSION=19.11
```

Init module system (only needed if `bash -l`):

```bash
source /etc/profile.d/hpcc_modules.sh
```

Unload all default modules:

```bash
module purge
```

Load compiler and libs:

```bash
module load base/gcc/8.3.0
module load fftw/3.3.5_gcc-8.3.0
module load openblas/0.3.17_gcc-8.3.0
```

Set compilers:

```bash
export CC=$(which gcc)
export CXX=$(which g++)
export FC=$(which gfortran)
```

Set flags:

```bash
export CFLAGS="-L${HPCC_MODULES}/fftw/3.3.5_gcc-8.3.0/lib"
export CPPFLAGS="-L${HPCC_MODULES}/fftw/3.3.5_gcc-8.3.0/lib"
export LDFLAGS="-I${HPCC_MODULES}/fftw/3.3.5_gcc-8.3.0/include"
```

Clean up (distclean hangs):

```bash
make clean
```

Build:

```bash
make \
INSTALL_DIR=${HPCC_MODULES}/${SOFTNAME}/${VERSION} \
MATHLIBS=openblas \
MATHLIBDIR=${HPCC_MODULES}/openblas/0.3.17_gcc-8.3.0/lib \
FFT=fftw3 \
FFTLIBDIR=${HPCC_MODULES}/fftw/3.3.5_gcc-8.3.0/lib \
COMMS_ARCH=mpi \
SUBARCH=mpi \
```

> NOTE: I also had to modify the top level `Makefile` to use `FFT=fftw3` and `MATHLIBS=openblas`

Install:

```bash
make install
```

## Intel

What are we installing:

```bash
SOFTNAME=castep
VERSION=19.11
```

Init module system:

```bash
source /etc/profile.d/hpcc_modules.sh
```

Clear all default modules:

```bash
module purge
```

Intel compilers 2018 (MPI errors) and oneapi (missing makefile) didn't work, so try `intel/2017` module:

```bash
module load intel/2017.4.196
```

Set `INTEL_BASE`, so we can use it later:

```bash
INTEL_BASE=${HPCC_MODULES}/intel/mkl/2017.2.174/compilers_and_libraries_2017.4.196/linux/
```

Set ARCH manually, its automatic, but easier to handle when static:

```bash
export CASTEP_ARCH=linux_x86_64_ifort17
```

Set compilers:

```bash
export CC=$(which icc)
export CXX=$(which icpc)
export FC=$(which ifort)
export F77=$(which ifort)
```

Set vars:

```bash
source ${INTEL_BASE}/bin/compilervars.sh intel64
```

Clean up (distclean hangs):

```bash
make clean
```

Delete previous make file:

```bash
rm -rf obj/${CASTEP_ARCH}--mpi
```

> NOTE: We could delete just the configs by removing `obj/${CASTEP_ARCH}--mpi/*.mkl` files

Build:

```bash
make \
MATHLIBS=mkl10 \
MATHLIBDIR=${INTEL_BASE}/mkl/lib/intel64_lin \
FFT=mkl \
FFTLIBDIR=${INTEL_BASE}/mkl/lib/intel64_lin \
COMMS_ARCH=mpi \
SUBARCH=mpi \
-j 8
```

> NOTE: We may need to build a `serial` version as well as an `mpi` version.

Install:

```bash
make install
```

