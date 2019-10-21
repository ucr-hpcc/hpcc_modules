# LAMMPS
LAMMPS can be easy to install, just use the internal make files.
Attempting to use the `Make.py` script may not work as intented.

# Install
Visit Github page and get latest stable release URL (ie. "copy link address") [https://github.com/lammps/lammps/releases](https://github.com/lammps/lammps/releases)

Then use wget to download on the cluster

```
Choose and create install location:

```bash
mkdir -p /bigdata/${GROUP}/shared/software/lammps
cd /bigdata/${GROUP}/shared/software/lammps
```

Download LAMMPS and decompress it:

```bash
wget https://github.com/lammps/lammps/archive/stable_7Aug2019.tar.gz #Use copied link from github
tar -xf stable_7Aug2019.tar.gz
```

Go to source code directory:
```bash
cd lammps-stable_7Aug2019/src
```

Build binary, static and shared libraries
```bash
make mode=lib g++_openmpi && make mode=shlib g++_openmpi
```

# Make.py Install
If the above compilations succeeded, than this is not necessary.
However, this could be useful as possible alternative MPI compilation option:

```bash
./Make.py -m mpi -jpg -fft fftw -a file   
```

OR

```bash
Make.py -v -p omp -o mpi -a file mpi
```

# Shared Libraries
For `ART nouveau`, and possibly other software as well, the LAMMPS static/shared library `liblammps_ARCH.a` is needed.
The mode `mode=shlib` will build shared libraries, and mode `mode=lib` will build static.
In the `Install` section above, we build both just in case.

# Notes
It is best to run only `make` from a clean src.
Attempting to make sepcific MACHINE makefiles failed.
Attempting to include extensions (KEN, FFTW, QUIP) failed on older 2016 versions.

