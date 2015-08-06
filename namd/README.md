# NAMD

## Prep
Use browser to login and download source for NAMD:
> `http://www.ks.uiuc.edu/Development/Download/download.cgi?PackageName=NAMD`
Once downloaded, transfer file to cluster under $SRCDIR.

Uncompress:
```
tar -xf NAMD_2.10_Source.tar.gz
cd NAMD_2.10_Source
```

### Charm
Compile Charm:
```
tar -xf charm-6.6.1.tar
cd charm-6.1.1
env MPICXX=mpicxx ./build charm++ mpi-linux-amd64 mpicxx --with-production --build-shared
```

## Compile

### NAMD
Return to NAMD source directory:
```
cd $SRCDIR/NAMD_2.10_Source
```
Install dependencies:
```
yum install -y fftw3 fftw3-devel fftw2 fftw2-devel tcl tcl-devel
```

Optionally edit various configuration files:
> (not needed if charm-6.6.1, fftw, and tcl are in NAMD_2.10_Source)
```
vim Make.charm                 # set CHARMBASE to full path to charm
vim arch/Linux-x86_64.fftw     # fix library name and path to files
vim arch/Linux-x86_64.tcl      # fix library version and path to TCL files
```

Compile for CPU installs:
```
./config Linux-x86_64-g++ --charm-arch mpi-linux-amd64-mpicxx
cd Linux-x86_64-g++
make -j 8
```

Compile for GPU installs:
The only changes to the build process needed are to add --with-cuda and --cuda-prefix to the NAMD config command line
```
./config Linux-x86_64-g++ --with-fftw3 --with-cuda --cuda-prefix=/usr/local/cuda --charm-arch mpi-linux-amd64-mpicxx
cd cd Linux-x86_64-g++
make -j 8
```

## Test
For MPI tests this must be done from within a job running under Torque:
```
qsub -I
cd $SRCDIR/NAMD_2.10_Source/Linux-x86_64-g++
mpirun ./namd2 src/alanin
```
> OR
```
qsub -I -l nodes=4:ppn=8,mem=16gb,walltime=01:00:00
cd /rhome/jhayes/iigb/torque/mpi/namd_test/NAMD_test_biocluster
mpirun --mca btl ^tcp namd2 run.conf &> run_bio.log
```

## Install
Copy files to proper install path:
```
cp -r Linux-x86_64-g++ $IIGB_MODULES/namd/2.10
```

## Cleanup

