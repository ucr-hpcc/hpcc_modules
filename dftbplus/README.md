# Install
First you will need to request a compute node to compile on:
```bash
srun -p intel --time=1-00:00:00 --ntasks=4 --pty bash -l
```

## Environment
Load and unload modules to fullfil requirements
```bash
module unload openmpi
module load intel/2018
```

## Download
```bash
mkdir -p /bigdata/$GROUP/shared/pkgs/dftbplus
cd /bigdata/$GROUP/shared/pkgs/dftbplus
git clone https://github.com/dftbplus/dftbplus.git latest
cd latest
git submodule update --init --recursive
```

## Options
Define the compiler and options with a make.arch file.
Since the provided intel make file seems compatible, link to it:
```bash
ln -s sys/make.x86_64-linux-intel make.arch
```

## Compile
```bash
make INSTALLDIR=/opt/linux/centos/7.x/x86_64/pkgs/dftbplus/18.2 WITH_DFTD3=1 WITH_MPI=1
```

## Test
The externals are required for running tests:
```bash
./utils/get_opt_externals ALL
```

If subsequent tests fail, then you may need to remove the socket/H20 tests, like this:
```bash
#sed -i -e '/^sockets\/H2O/d' -e '/^sockets\/diamond/d' test/prog/dftb+/tests
```
The above "solution" was taken from [here](https://github.com/UCL-RITS/rcps-buildscripts/issues/113).

Also you need to have the command `fuser` in your path, so add sbin to your PATH:
```
export PATH=/usr/sbin:$PATH
```

### Single Test
```bash
make test
```

### OMP Test
```bash
make -j2 test TEST_OMP_THREADS=2
```

### MPI Test
```bash
make test TEST_MPI_PROCS=2
```

### OMP and MPI Test (hybrid)
```bash
make test TEST_MPI_PROCS=2 TEST_OMP_THREADS=2
```

## Install
```bash
make install
```
