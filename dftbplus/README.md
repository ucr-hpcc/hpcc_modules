# Install
First you will need to request a compute node to compile on:
```bash
srun -p intel --time=1-00:00:00 --ntasks=4 --pty bash -l
```

## Environment
Load and unload modules to fullfil requirements
module unload openmpi
module load intel/2018

## Download
mkdir -p /bigdata/$GROUP/shared/pkgs//dftbplus
cd /bigdata/$GROUP/shared/pkgs//dftbplus
git clone https://github.com/dftbplus/dftbplus.git latest
cd latest
git submodule update --init --recursive

## Options
Define the compiler and options with a make.arch file.
Since the provided intel make file seems compatible, link to it:
```bash
ln -s sys/make.x86_64-linux-intel make.arch
```

## Compile
```bash
make -j 2
```

## Test
The externals are required for running tests:
```bash
./utils/get_opt_externals ALL
```

Also you need to have the command `fuser` in your path, so add sbin to your PATH:
```
export PATH=/usr/sbin:$PATH
```

Do the tests:
```bash
make -j 2 test
```
