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

## ScalaPack

The `ScalaPack` version is currently broken (ie. undefined reference to MPI functions), however here it is for reference:

Get makefile with `ScalaPack`:

```bash
wget -O make.sys https://raw.githubusercontent.com/ucr-hpcc/hpcc_modules/main/fhi-aims/171221/make.sys_intel_scalapack
```

Build with `ScalaPack`:

```bash
make scalapack.mpi
```
