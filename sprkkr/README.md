# Install
## Get Source
The source code was provided by the user.
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
