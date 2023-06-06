## Installed `amber` from source [ [URL](https://ambermd.org/GetAmber.php) ]  

Installation of amber doesn't support MPI

```sh
module load miniconda3
cd /opt/linux/rocky/8.x/x86_64/src/a/amber/amber22/amber22_src/build/
./run_cmake
make
```

## Installation of MPI+CUDA version

### Extract source files

```
cd /opt/linux/rocky/8.x/x86_64/src/a/amber/
mkdir 22_mpi_cuda
cd 22_mpi_cuda
tar -xvf ../AmberTools22.tar.bz2
tar -xvf ../Amber22.tar.bz2
```

### Modify run_cmake

```
HPCC_INSTALL_DIR=$HPCC_MODULES/amber/22_mpi_cuda

-DCMAKE_INSTALL_PREFIX=$HPCC_INSTALL_DIR
-DMPI=TRUE
-DCUDA=TRUE
-DDOWNLOAD_MINICONDA=FALSE
-DBUILD_QUICK=TRUE
-DNCCL=TRUE
-DNCCL_INCLUDE_DIR=/opt/linux/rocky/8.x/x86_64/pkgs/nccl/2.18.1-1/include
-DNCCL_LIBRARY=/opt/linux/rocky/8.x/x86_64/pkgs/nccl/2.18.1-1/lib/libnccl.so
-DCHECK_UPDATES=FALSE
```

### Prepare and load a conda environment

```
module load miniconda3
conda create -p /opt/linux/rocky/8.x/x86_64/pkgs/amber/22_mpi_cuda/amber_conda_venv
conda activate /opt/linux/rocky/8.x/x86_64/pkgs/amber/22_mpi_cuda/amber_conda_venv
```

### Load relevant modules

```
module load openmpi/4.1.2_slurm-23.02.2_mpi1-compat
module load cuda/11.4
# netcdf probably not needed...
#module load netcdf-c/4.9.0_openmpi-4.1.2
#module load netcdf-fortran/4.6.0_openmpi-4.1.2
```

### Compile NCCL (optional, TIME CONSUMING)

```
make src.build
mkdir -p $HPCC_MODULES/nccl/2.18.1-1
make PREFIX=$HPCC_MODULES/nccl/2.18.1-1 install
```

### Add NCCL to paths (probably not needed, since we have to hardcode the paths above)

```
INCLUDE_PATH=/opt/linux/rocky/8.x/x86_64/pkgs/nccl/2.18.1-1/include:$INCLUDE_PATH
LIBRARY_PATH=/opt/linux/rocky/8.x/x86_64/pkgs/nccl/2.18.1-1/lib:$LIBRARY_PATH
LD_LIBRARY_PATH=/opt/linux/rocky/8.x/x86_64/pkgs/nccl/2.18.1-1/lib:$LD_LIBRARY_PATH
```

### Build

```
./run_cmake
make install
```
