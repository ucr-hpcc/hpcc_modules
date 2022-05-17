# User Makefiles

These are some example `make.sys` files for `fhi-aims` (version `171221`) from a user on the cluster.
These are untested, and likely not working for our current environment.
However, they could be useful for reference.

## Build

Move to src directory

```bash
cd fhi-aims.171221_intel/src
```

Modify (or create) makefile

```bash
vim make.sys
```

Build binaries

```bash
make mpi
```
