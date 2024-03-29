# Compile

## Node/Job Type

```bash
srun -p short -C amd -c 4 --mem=10g --pty bash -l
```

## Modules Loaded

Rocky 8:

```bash
module purge
module load slurm/21.08.5 
# Using native GCC 8.5
```

CentOS 7:

```bash
module purge
module load cmake/3.4.0 extra/1 GCC/5.4.0-2.26 slurm/19.05.0 openmpi/4.0.1-slurm-19.05.0 binutils/2.26-GCCcore-5.4.0
```

# Configure

For Rocky 8 (had MPI compiler errors):

```bash
cmake \
        -DCMAKE_C_COMPILER=mpicc \
        -DCMAKE_CXX_COMPILER=mpicxx \
        -DEIGEN3_INCLUDE_DIR=/usr/include/eigen3/ \
        -DCMAKE_INSTALL_PREFIX=${HPCC_MODULES}/${SOFT_NAME}/${SOFT_VER}/ ..
```

For CentOS 7:

```bash
cmake \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DEIGEN3_INCLUDE_DIR=/opt/linux/centos/7.x/x86_64/pkgs/eigen/3.3.7/include/eigen3/ \
    -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/iqtree/2.1.1-mpi/ ..
```

# Make

```bash
make -j 4 && make install
```

# Other good examples

[http://protocols.faircloth-lab.org/en/latest/protocols-computer/compilation/compiling-iq-tree.html](http://protocols.faircloth-lab.org/en/latest/protocols-computer/compilation/compiling-iq-tree.html)
