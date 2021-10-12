# IOAPI

NOTES:
  * IOAPI was installed with the PGI compiler (21.9-0).
  * Check your versions of compilers and dependencies, they need to be compatible (similar release time frame).
    * PGI - 21.9-0
    * HDF5 - 1.12.0
    * NetCDF-C - 4.8.1
    * NetCDF-Fortran - 4.5.3
    * IOAPI - 3.2 (Dropbox)

## Install PGI

Had to download the entire Nvidia HPC suite: https://developer.nvidia.com/nvidia-hpc-sdk-downloads
Once downloaded, just extract and execute `installer` script:

```bash
tar -xf 2021_219_Linux_x86_64_cuda_11.4.tar.gz
./2021_219_Linux_x86_64_cuda_11.4/install
```

## Install HDF5

Download `hdf5-1.12.0.tar.gz`, etract and install with C++ and Fortran interfaces:

```bash
# Load PGI compiler
module load extra nvhpc/21.9

# Set compilers
export CC=$(which pgcc)
export CXX=$(which pgc++)
export FC=$(which pgf90)

# Confiugre
./configure \
--prefix=/opt/linux/centos/7.x/x86_64/pkgs/hdf5/1.12.0_pgi-21.9-0 \
--enable-fortran \
--enable-cxx \
--enable-shared \
--enable-static

# Build
make

# Insatll
make install

# Test
make check
```

## Install NetCDF-C

Download and install with the `--disable-dap` flag:

```
# Load modules
module load extra nvhpc/21.9
module load hdf5/1.12.0_pgi-21.9-0

# Set compilers
export CC=$(which pgcc)
export CXX=$(which pgc++)
export FC=$(which pgf90)

# Set flags
export CFLAGS=-DpgiFortran
export CPPFLAGS="-I${HPCC_MODULES}/hdf5/1.12.0_pgi-21.9-0/include"
export LDFLAGS="-L${HPCC_MODULES}/hdf5/1.12.0_pgi-21.9-0/lib -lhdf5"

# Confiugre netcdf
./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/netcdf-c/4.8.1_pgi-21.9-0 --disable-dap

# Build
make

# Install
make install

# Test
make check
```

## Install NetCDF-Fortran

Download and install:

```
# Load modules
module load extra nvhpc
module load hdf5/1.12.0_pgi-21.9
module load netcdf-c/4.8.1_pgi-21.9-0

# Set Compilers
export CC=$(which pgcc)
export CXX=$(which pgc++)
export FC=$(which pgf90)

# Set Flags
export CPPFLAGS="-I${HPCC_MODULES}/netcdf-c/4.8.1_pgi-21.9-0/include"
export LDFLAGS="-L${HPCC_MODULES}/netcdf-c/4.8.1_pgi-21.9-0/lib -lnetcdf"
export CFLAGS=-DpgiFortran

# Configure
./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/netcdf-fortran/4.5.3_pgi-21.9-0

# Build
make

# Install
make install

# Test
make check
```

## Install IOAPI

Download `IOAPI`, extract, modify `Makefiles`, configure, and install.

### Prep and Makefiles

First iterate through source code and replace BASEDIR  with real BASEDIR:

```bash
# Set base dir to top level source directory
BASEDIR=$(pwd)

for file in $(grep -R '^BASEDIR = ${HOME}/ioapi-3.2'| cut -f1 -d:); do
    sed -i "s/^BASEDIR = \${HOME}\/ioapi-3.2/BASEDIR = ${BASEDIR}/g" $file;
done

Then modify Top level `${BASEDIR}/Makefile` with the following customizations:
```
OAPIDEFS   = "-DIOAPI_NCF4=1"
DEFINEFLAGS = "-DIOAPI_NCF4=1"
ARCHFLAGS  = "-DIOAPI_NCF4=1"
VERSION    = 3.2-${CPLMODE}
BASEDIR    = /opt/linux/centos/7.x/x86_64/src/ioapi/ioapi-3.2-20200828
NCFLIBS    = -L/opt/linux/centos/7.x/x86_64/pkgs/netcdf-fortran/4.5.3_pgi-21.9-0/lib/ -lnetcdff \
             -L/opt/linux/centos/7.x/x86_64/pkgs/netcdf-c/4.8.1_pgi-21.9-0/lib -lnetcdf \
             -L/opt/linux/centos/7.x/x86_64/pkgs/hdf5/1.12.0_pgi-21.9-0/lib -lhdf5hl_fortran -lhdf5_fortran -lhdf5_hl
IODIR      = $(BASEDIR)/ioapi
FIXDIR     = $(IODIR)/fixed_src
HTMLDIR    = $(BASEDIR)/HTML
TOOLDIR    = $(BASEDIR)/m3tools
OBJDIR     = $(BASEDIR)/$(BIN)
INSTALL   = /opt/linux/centos/7.x/x86_64/pkgs/ioapi/3.2_pgi-21.9-0
LIBINST   = $(INSTALL)/lib
BININST   = $(INSTALL)/bin
```

The other makes files (IOAPI level `${BASEDIR}/ioapi/Makefile` and M3Tools `${BASEDIR}/m3tools/Makefile`), were auto generated.
However, still best to confirm that the paths are consistant with top level `${BASEDIR}/Makefile`.

### Build

```bash
# Load modules
module load extra nvhpc
module load hdf5/1.12.0_pgi-21.9
module load netcdf-c/4.8.1_pgi-21.9-0
module load netcdf-fortran/4.5.3_pgi-21.9-0

# Set Vars
export BASEDIR=$(pwd)
export INSTDIR=${HPCC_MODULES}/ioapi/3.2_pgi-21.9-0
export LIBINST=${INSTDIR}/lib
export BININST=${INSTDIR}/bin

# Set Compilers
export CC=$(which pgcc)
export CXX=$(which pgc++)
export FC=$(which pgf90)

# Set Flags
export CPPFLAGS="-DpgiFortran"

# Build
make BIN=Linux2_x86_64pg CPLMODE=nocpl INSTALL=${INSTDIR} all

# Install
mkdir -p ${INSTDIR}
make BIN=Linux2_x86_64pg CPLMODE=nocpl install
```

