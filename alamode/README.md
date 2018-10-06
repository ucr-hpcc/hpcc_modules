# Install
The directories alm/, anphon/, and tools/ contain separate Makefiles.
Please modify the Makefiles appropriately by changing variables such as
CXX, CXXFLAGS, or MPICXX. Then, unload openmpi and load intel.
```
module unload openmpi
module load intel
```
Then execute "make" within each program directory, which will create the binary for each program.

## ALM
```
CXX = icpc
MPICXX = mpiicpc
CXXFLAGS = -O2 -xHOST -qopenmp -std=c++11
INCLUDE = -I../include -I/opt/linux/centos/7.x/x86_64/pkgs/boost/1.64.0/include
LDFLAGS = -mkl
```

## ANPHON
```
MPICXX = picxx
CXXFLAGS = -O3 -xHOST -qopenmp -std=c++11
INCLUDE = -I../include -I/opt/linux/centos/7.x/x86_64/pkgs/eigen/3.2.10

LINKER = ${MPICXX}
LDFLAGS = -mkl

LAPACK =
LIBS = ${LAPACK}
```

## Tools
```
#Intel compiler
CXX = icpc

CXXFLAGS = -O2 -std=c++11 -qopenmp

# Add the directory containing boost header files here
INCLUDE = -I../include -I$(HOME)/include -I/opt/linux/centos/7.x/x86_64/pkgs/boost/1.64.0/include/
```
