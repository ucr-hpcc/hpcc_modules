# Install
## Get Source
Orignal source code was provided by the user.
However, one could likely get it from [here](https://www.ebert.cup.uni-muenchen.de/kkr/kkrlicense/).

## Extract
Set SRC_ROOT to wherever you want SPRKKR installed.
```bash
export SRC_ROOT=/opt/linux/centos/7.x/x86_64/pkgs/sprkkr/7.7.0
```
Uncompress the files from within a subdirectory:
```bash
mkdir $SRC_ROOT
mv /wherever/the/source/code/lives/PUB7.7.1_170921_09h44.tar.gz $SRC_ROOT/
cd $SRC_ROOT
tar -xf PUB7.7.1_170921_09h44.tar.gz
```

## Edit make.inc
Here are the values used in the latested compilation:
```
BIN = .
LIB = -lblas -llapack 
INCLUDE = -I/opt/linux/centos/7.x/x86_64/pkgs/openmpi/2.0.1-slurm-16.05.4/include/ 
FFLAGS = -O2
FC   = mpif90 -c $(FFLAGS) $(INCLUDE)
LINK = mpif90    $(FFLAGS) $(INCLUDE)
MPI=MPI
```

### Compile
From the source directory, run the following:
```bash
make allmpi
```
