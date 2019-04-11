# Compiling
For all examples you must request the whole node, or some tests seem to use 32 (all) cores possible.
```
srun -p intel --time=1-00:00:00 --ntasks=4 --cpus-per-task=8 --pty bash -l
```

## GNU Example

```bash
module load openmpi/2.0.1-slurm-16.05.4

cd /opt/linux/centos/7.x/x86_64/pkgs/amber/16_gnu_mpi
tar -C . -xf ${PATH_TO_AMBER_SRC}/Amber16.tar.bz2
tar -C . -xf ${PATH_TO_AMBER_SRC}/AmberTools16.tar.bz2

# Set Amber home
export AMBERHOME=$(pwd)

# Clean out previous build
make clean || echo 'All Clean'

# Configure build for CUDA and MPI
./configure -mpi gnu

source amber.sh

# Must use a multiple of 4 but not more than 8? Some tests will fail otherwise
export DO_PARALLEL='mpirun -np 4'

make -j2 install
make test
```

## Intel Example

```bash
module unload openmpi
module load intel/2018
module load cuda/9.0

cd /opt/linux/centos/7.x/x86_64/pkgs/amber/16_intel
tar -C . -xf ${PATH_TO_AMBER_SRC}/Amber16.tar.bz2
tar -C . -xf ${PATH_TO_AMBER_SRC}/AmberTools16.tar.bz2


# Set MKL Home
export MKL_HOME=$MKLROOT

# Set Amber home
export AMBERHOME=$(pwd)

# Clean out previous build
make distclean || echo 'All clean'

# Configure build for CUDA and MPI for intel
./configure -mpi intel

if [[ $? -eq 0 ]]; then source amber.sh; fi

if [[ $? -eq 0 ]]; then make -j2 install; fi

if [[ $? -eq 0 ]]; then make test; fi
```
