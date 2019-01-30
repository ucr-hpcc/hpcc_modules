# CPMD with qmmm


## Install


#### Unpack tar

```bash
tar -zxvf CPMD4.1-Rev4000.tar.gz
cd CPMD
```

#### Load Intel 2017.4.196 and run configure.sh calling correct environment.
Version 2017.4.196 is needed specifically.
Other versions of Intel produce segfault errors later in the CPMD run. 

```bash
module load intel/2017.4.196
./configure.sh -qmmm LINUX-X86_64-INTEL-MPI-FFTW
```

### Edit Makefile before compiling

Makefile created from the configure.sh script:

```bash
#########################################################################
# platform-dependent stuff
# this section is built by the configure.sh script: no manual editing
# should be required.
#########################################################################
FFLAGS = -O2 -I$(MKLROOT)/include/fftw -axAVX -I${SRCDIR} -I${OBJDIR}
LFLAGS = -static-intel -mkl=sequential -L$(MKLROOT)/include/fftw -axAVX
CFLAGS = -O2 -I${SRCDIR}
NVCCFLAGS =  -I${SRCDIR}
CPP = /usr/bin/cpp -P -C -traditional
CPPFLAGS = -D__Linux -D__INTEL -D__HAS_FFT_FFTW3 -D__HAS_BF_STREAM_IO -D__PARALLEL -D__HAS_DFREPOSITORY  -D__GROMOS  -D'SVN_REV="4610"'
NOOPT_FLAG =  -O1
CPPFLAGS_GROMOS = -DEWALD -DEWATCUT -DHAT_SHAPE -DUNPACKED_GRID
FFLAGS_GROMOS = $(FFLAGS) -fixed -I${MODDIR}
FFLAGS_GROMOS_MODULES = $(FFLAGS) -I${MODDIR}
FFLAGS += -I/opt/linux/centos/7.x/x86_64/src/cpmd/CPMD/modules
CC = icc
FC = mpif90
LD = mpif90
NVCC =
AR = /usr/bin/ar ruv
RANLIB = /usr/bin/ranlib
#########################################################################
```

Change the CPP, CC, FC, and LD lines to match the following:

```bash
#########################################################################
# platform-dependent stuff
# this section is built by the configure.sh script: no manual editing
# should be required.
#########################################################################
FFLAGS = -O2 -I$(MKLROOT)/include/fftw -axAVX -I${SRCDIR} -I${OBJDIR}
LFLAGS = -static-intel -mkl=sequential -L$(MKLROOT)/include/fftw -axAVX
CFLAGS = -O2 -I${SRCDIR}
NVCCFLAGS =  -I${SRCDIR}
CPP = /usr/bin/cpp -P -traditional
CPPFLAGS = -D__Linux -D__INTEL -D__HAS_FFT_FFTW3 -D__HAS_BF_STREAM_IO -D__PARALLEL -D__HAS_DFREPOSITORY  -D__GROMOS  -D'SVN_REV="4610"'
NOOPT_FLAG =  -O1
CPPFLAGS_GROMOS = -DEWALD -DEWATCUT -DHAT_SHAPE -DUNPACKED_GRID
FFLAGS_GROMOS = $(FFLAGS) -fixed -I${MODDIR}
FFLAGS_GROMOS_MODULES = $(FFLAGS) -I${MODDIR}
FFLAGS += -I/opt/linux/centos/7.x/x86_64/src/cpmd/CPMD/modules
CC = mpiicc
FC = mpiifort
LD = mpiifort
NVCC =
AR = /usr/bin/ar ruv
RANLIB = /usr/bin/ranlib
#########################################################################
```

Save the Makefile after the edits.

#### Compile CPMD

```bash
make
```

#### Copy the binary file cpmd.x to a install location

```bash
cp ./bin/cpmd.x /opt/linux/centos/7.x/x86_64/pkgs/cpmd/4.1/bin/cpmd.x
```

## Create environment module for it.

```bash
cat /opt/linux/centos/7.x/x86_64/modules/cpmd/4.1 
#%Module1.0#####################################################################
##
## cpmd modulefile
##
proc ModulesHelp { } {
        global version prefix

                puts stderr "\t cpmd - Adds cpmd to your path"
                }

                module-whatis   "cpmd-4.1"

                set      iigb_modules    $::env(IIGB_MODULES)
                set      modules_dir     $::env(MODULES_DIR)

                # for Tcl script use only
                set     version         3.2.9
                set     prefix          ${modules_dir}/${version}
                set     exec_prefix     ${prefix}
                set     datarootdir     ${prefix}/share

                module load intel/2017.4.196

                prepend-path    PATH            ${iigb_modules}/cpmd/4.1/bin

                module          use             ${modules_dir}
```

### Running CPMD

Sample slurm submission script:

```bash
#!/bin/bash -l
#SBATCH --ntasks=48
#SBATCH --mem-per-cpu=2G
#SBATCH --job-name="cpmd48"
#SBATCH -p short,intel
module load cpmd

mpirun -np 48 cpmd.x qmmm_run.inp > qmmm_run.out
```
