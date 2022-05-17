# User Makefiles

These are some example `make.sys` files for `fhi-aims` (version `171221`) from a user on the cluster.
The GCC version is untested, and likely not working for our current environment.
However, the Intel version is tested, and seems to compile a working binary on our current environment.

## Build

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

Or, if you want to enable `ScalaPack`:

```bash
wget -O make.sys https://raw.githubusercontent.com/ucr-hpcc/hpcc_modules/main/fhi-aims/171221/make.sys_intel_scalapack
```

Build binaries:

```bash
make mpi
```

Or, if you got the make.sys with `ScalaPack`:

```bash
make scalapack.mpi
```
