# Requirement
- `gcc 8.3.0`, unsure what is the minumum version is
- `libxc`
- `netcdf-c`
- `netcdf-fortran`
- `mpi`

# Installation
Installation on UCR HPCC, make sure to check the newest version of abinit.

```bash
srun -p short --mem=2gb --cpus-per-task 8 --ntasks 1 --time 2:00:00 --pty bash -l
module load base/gcc/8.3.0
module load libxc/4.2.3
wget https://www.abinit.org/sites/default/files/packages/abinit-9.4.2.tar.gz
tar zxvf abinit-9.4.2.tar.gz
cd abinit-9.4.2
./configure \
  --with-netcdf="$HPCC_MODULES/netcdf-c/4.8.0_gcc-8.3.0" \
  --with-netcdf-fortran="$HPCC_MODULES/pkgs/netcdf-fortran/4.5.3_gcc-8.3.0" \
  --with-libxc="$HPCC_MODULES/libxc/4.2.3" \
  --prefix=<installation directory> \
  --with-mpi FC=mpif90
make -j$(nproc)
make install
```

# Running the program
Make sure to load `base/gcc/8.3.0` and `libxc/4.2.3` before running the program.
