# Installing 22.2

## Downloading

### Pull down the source code, extract it

```
wget https://github.com/dftbplus/dftbplus/releases/download/22.2/dftbplus-22.2.tar.xz
tar xvf dftbplus-22.2.tar.xz
```

### Load modules needed to install it

```
module purge
module load mpich slurm

cd dftbplus-22.2
```

### Edit the cmake config file

```
vim config.cmake
# Set WITH_MPI to TRUE
```

### Install Extra Components

```
./utils/get_opt_externals
```

### Configure

```
FC=mpifort cmake -DSCALAPACK_LIBRARY=/opt/linux/rocky/8.x/x86_64/pkgs/scalapack/2.2.0_gcc-9.2.1/lib/libscalapack.a -DCMAKE_INSTALL_PREFIX=$HPCC_MODULES/dftbplus/22.2 -DTOOLCHAIN=gnu -B _build .
```

### Build

```
cmake --build _build -- -j
```

### Testing

```
pushd _build
ctest -j$(nproc)
popd
```

### Installing

```
cmake --install _build
```
