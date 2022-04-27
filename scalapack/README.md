# SCALAPACK

## Prep

Ensure `lapack` and `openblas` RPM libs and devel packages are installed.
Also load any modules that are needed, in this case we want to build agains GCC 9:

```bash
module unload openmpi
module load mpich/4.0.1_gcc-9.2.1
```

## Configure

A ton of auto dectection occurs, however when compiling for MPI you need to be explicit with the compilers:

```bash
cmake -DCMAKE_C_COMPILER=$(which mpicc) -DCMAKE_Fortran_COMPILER=$(which mpif90) .
```

## Build

```bash
make
```

## Install

There is no installation, the library is built under the `./lib` directory.

