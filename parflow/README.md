# Install
## Load Software
```bash
module unload openmpi
module load intel
module load mpich
```

## Export MPI paths
```bash
export MPI_PATH=/opt/linux/centos/7.x/x86_64/pkgs/mpich/3.2.1/
export LD_LIBRARY_PATH=$MPI_PATH/lib:$LD_LIBRARY_PATH
export PATH=$MPI_PATH/bin:$PATH
export PATH=/usr/bin:/bin:$PATH
```

## Export compilers
```bash
export CC=icc
export FC=ifort
export F77=ifort
export CXX=icpc
```

## Export paths
Where software will be installed:
```bash
export SOFT_DIR=/opt/linux/centos/7.x/x86_64/pkgs
```

Where PARFLOW will be installed:
```bash
export PARFLOW_DIR=$SOFT_DIR/parflow/3.2.0
```

Where all the source code lives:
```bash
export SOURCE_DIR=/opt/linux/centos/7.x/x86_64/src/ParFlow
```

## Make source directory
```bash
mkdir -p $SOURCE_DIR
cd $SOURCE_DIR
```

## Install SILO
```bash
tar -xvf $SOURCE_DIR/silo-4.10.2.tar.gz
cd silo-4.10.2
# Configuration step specifying this location
./configure --disable-silex --prefix=$SOFT_DIR/silo/4.10.2
# will test making then make binary  in specified path
make && make install
cd ../
```

## Install Hypre
```bash
tar -xvf hypre-2.9.0b.tar.gz
cd hypre-2.9.0b/src
# will put sunder software folder with with last directory being version
./configure --prefix=$SOFT_DIR/hypre/2.9.0b --with-MPI --with-MPI-include=$MPI_PATH/include --with-MPI-libs=mpi --with-MPI-lib-dirs=$MPI_PATH/lib
make && make install
cd ../../
```

## Install ParFlow
### Extract Parflow
```bash
tar -xvf parflow-3.2.0.tar.gz
```

### Apply Patch (CLM Jacob's Modification)
Apply path to `parflow-3.2.0/pfsimulator/clm/drv_restart.F90`
```diff
126c126
<      write(TS,'(I6.6)') tstamp
---
>      write(TS,'(I5.5)') tstamp
440c440
<         write(TS,'(I6.6)') tstamp
---
>         write(TS,'(I5.5)') tstamp
```

# Install pfsimulator
```bash
cd parflow-3.2.0/pfsimulator
./configure --prefix=$PARFLOW_DIR --enable-timing --with-clm --with-silo=$SOFT_DIR/silo/4.10.2 \
--with-hypre=$SOFT_DIR/hypre/2.9.0b --with-x --with-amps=mpi1 --with-amps-sequential-io \
--with-slurm=/opt/linux/centos/7.x/x86_64/pkgs/slurm/16.05.4
make && make install
cd ..
```

# Install pftools
```bash
cd pftools
./configure --prefix=$PARFLOW_DIR --with-silo=$SOFT_DIR/silo/4.10.2 --with-hypre=$SOFT_DIR/hypre/2.9.0b \
--with-x --with-amps=mpi1 --with-tcl --with-amps-sequential-io
make && make install
cd ..
```

## Tests
```bash
cd test
make check
```
