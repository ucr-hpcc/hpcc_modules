## Compiling

# Intel Example

```bash
module unload openmpi
module load intel/2018
module load cuda/9.0

cd /opt/linux/centos/7.x/x86_64/pkgs/amber/16_intel

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
