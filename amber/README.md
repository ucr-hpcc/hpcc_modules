# Compiling
For all examples you must request the whole node, since some tests seem to use 32 (all) cores available.
```
srun -p intel --time=1-00:00:00 --ntasks=4 --cpus-per-task=8 --pty bash -l
```

## GNU Example
### MPI
```bash
module load openmpi/2.0.1-slurm-16.05.4

cd /opt/linux/centos/7.x/x86_64/pkgs/amber/16_gnu_mpi
tar -C . -xf ${PATH_TO_AMBER_SRC}/Amber16.tar.bz2
tar -C . -xf ${PATH_TO_AMBER_SRC}/AmberTools16.tar.bz2

# Set Amber home
export AMBERHOME=$(pwd)

# Clean out previous build
make clean || echo 'All Clean'

# Configure build with GNU and MPI
yes | ./configure -mpi gnu

if [[ $? -eq 0 ]]; then source amber.sh; fi

if [[ $? -eq 0 ]]; then make -j2 install; fi

if [[ $? -eq 0 ]]; then
    # Must use a multiple of 4 but not more than 8? Some tests will fail otherwise
    export DO_PARALLEL='mpirun -np 4'
    make test
fi
```

## Intel Example
### Serial
```bash
module unload openmpi
module load intel/2018

cd /opt/linux/centos/7.x/x86_64/pkgs/amber/16_intel
tar -C . -xf ${PATH_TO_AMBER_SRC}/Amber16.tar.bz2
tar -C . -xf ${PATH_TO_AMBER_SRC}/AmberTools16.tar.bz2


# Set MKL Home
export MKL_HOME=$MKLROOT

# Set Amber home
export AMBERHOME=$(pwd)

# Clean out previous build
make distclean || echo 'All clean'

# Configure build with Intel
#yes | ./configure -mpi intel # MPI
yes | ./configure intel # Serial

if [[ $? -eq 0 ]]; then source amber.sh; fi

if [[ $? -eq 0 ]]; then make -j2 install; fi

if [[ $? -eq 0 ]]; then
    # Must use a multiple of 4 but not more than 8? Some tests will fail otherwise
    #export DO_PARALLEL='mpirun -np 4'
    make test
fi
```
### MPI
```bash
module unload openmpi
module load intel/2017.4.196

cd /opt/linux/centos/7.x/x86_64/pkgs/amber/16_intel-2017_mpi
tar -C . -xf ${PATH_TO_AMBER_SRC}/Amber16.tar.bz2
tar -C . -xf ${PATH_TO_AMBER_SRC}/AmberTools16.tar.bz2

# Enter the amber HOME directory
cd /rhome/syamijala/bigdata/Softwares/amber16_intel/


# Set the AMBERHOME
export AMBERHOME=/rhome/syamijala/bigdata/Softwares/amber16_intel/


# clean the old miniconda, libfftw etc.

make distclean


# first configure the serial version and install it

yes | ./configure intel
test -f /rhome/syamijala/bigdata/Softwares/amber16_intel//amber.sh
source /rhome/syamijala/bigdata/Softwares/amber16_intel//amber.sh
make install -j 2


# use intelmpi instead of mpi for less errors (remember you have already
loaded intel 2017. So you have intelmpi available)
yes | ./configure -intelmpi intel
test -f /rhome/syamijala/bigdata/Softwares/amber16_intel//amber.sh
source /rhome/syamijala/bigdata/Softwares/amber16_intel//amber.sh
make install -j 2

export DO_PARALLEL="mpirun -np 4"

make test
```
