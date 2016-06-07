# LAMMPS
LAMMPS is one of those softwares that tries to make compiling easy.
At first glance, you are capable of generating your own Makefiles, or maybe even custom writing your own.
However this only leads to failure.
Even using the Make.py script did not function as expected. Possibly due to previous compilation attempts.
You must ensure a clean src directory by only compiling once, otherwise the results are unpredictable.

# Install
```
wget <URL>
tar -xf <file>.tar.gz
cd <newfolder>/src
make mpi
```

# Make.py Install
This could be potentially useful, possible alternative MPI compilation options:
```
./Make.py -m mpi -jpg -fft fftw -a file   
```
OR
```
Make.py -v -p omp -o mpi -a file mpi
```

# Notes
It is best to run only "make mpi" from a clean src.
Attempting to make sepcific MACHINE makefiles failed.
Attempting to include extensions (KEN, FFTW, QUIP) failed.
For some reason CUDA and INTEL (ifort?) builds were also included during compile time.

