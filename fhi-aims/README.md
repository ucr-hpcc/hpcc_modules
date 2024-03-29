# FHI-AIMS

When compiling with `GCC`, first request an AMD node:

```bash
srun -p short -C amd -c 4 --mem=10g --pty bash -l
```

When compiling with `Intel` (`oneapi`), first request an AMD node:
```bash
srun -p short -C intel -c 4 --mem=10g --pty bash -l
```

## Prep

Aquire the source code and upload it to the cluster. Extract source and move into source directory. 
This source directory will henceforth be refered to as `$FHI_AIMS`.
Download the appropriate CMake cache files within `$FHI_AIMS` like so:

```bash
wget https://raw.githubusercontent.com/ucr-hpcc/hpcc_modules/main/fhi-aims/initial_cache.cmake_intel
```

OR

```bash
wget https://raw.githubusercontent.com/ucr-hpcc/hpcc_modules/main/fhi-aims/initial_cache.cmake_gcc9
```

Then create a build directory:

```bash
mkdir $FHI_AIMS/build_intel
```

OR

```bash
mkdir $FHI_AIMS/build_gcc9
```

## Configure

Move into the build directory and run `cmake` using the CMake cache file:

```bash
cd $FHI_AIMS/build_intel
module unload openmpi gcc mpich
module load oneapi/2022.1.2.146
cmake -C ../initial_cache.cmake_intel ../
```

OR

```bash
cd $FHI_AIMS/build_gcc9
module unload openmpi oneapi
module load mpich/4.0.1_gcc-9.2.1
cmake -C ../initial_cache.cmake_gcc9 ../
```

## Build

From within each build directory run the `make` command:

```bash
make -j 4
```

This should result in a file called `aims.210716_3.scalapack.mpi.x`.

## Install

Copy the resulting binaries to a reasonable location and rename with the appropriate suffix:

```bash
mkdir $FHI_AIMS/bin
cp $FHI_AIMS/build_intel/aims.210716_3.scalapack.mpi.x $FHI_AIMS/bin/aims.210716_3.scalapack.mpi.x_intel
cp $FHI_AIMS/build_gcc9/aims.210716_3.scalapack.mpi.x $FHI_AIMS/bin/aims.210716_3.scalapack.mpi.x_gcc9
```

Ensure this new `bin` path is added to your path (add to your ~/.bashrc file for persistence):

```bash
export PATH=$FHI_AIMS/bin:$PATH
```
