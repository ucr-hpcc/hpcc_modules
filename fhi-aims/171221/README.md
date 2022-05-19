# User Makefiles

These are some example `make.sys` files for `fhi-aims` (version `171221`) from a user on the cluster.
The GCC version is untested, and likely not working for our current environment.
However, the Intel version is tested, and seems to compile a working binary on our current environment.

## MPI

Move to src directory:

```bash
cd fhi-aims.171221_intel/src
```

Load `Intel` compilers:

```bash
module load oneapi
```

Get makefile:

```bash
wget -O make.sys https://raw.githubusercontent.com/ucr-hpcc/hpcc_modules/main/fhi-aims/171221/make.sys_intel
```

Build binaries:

```bash
make mpi
```

## Aitranss

From the same shell as when you built fhi-aims above, move to src directory:

```bash
cd fhi-aims.171221_intel/src/aitranss/source
```

Patch the `Makefile`:

```bash
sed -i 's/\-openmp/-qopenmp/g' Makefile
```

Update `Makefile`, ensure the following lines:

```bash
FC=ifort
LD=ifort
FFLAGS= -132 -implicitnone -warn all -qopenmp -assume byterecl -O3
LIBS= -L${MKLROOT}/lib/intel64 -lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -qopenmp -lpthread -lm
```

All other references to these variables should be commented out or removed.

Then build it:

```bash
make
```

This should place a binary with in the top level bin (ie. `fhi-aims.171221/bin`).

## ScalaPack (not working)

The `ScalaPack` version is currently broken (ie. undefined reference to MPI functions), however here it is for reference:

Get makefile with `ScalaPack`:

```bash
wget -O make.sys https://raw.githubusercontent.com/ucr-hpcc/hpcc_modules/main/fhi-aims/171221/make.sys_intel_scalapack
```

Build with `ScalaPack`:

```bash
make scalapack.mpi
```
