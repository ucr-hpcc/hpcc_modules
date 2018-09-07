# Install
Had to log into a node that was not used by others, and unmount/unlink /opt so that the Intel installer did not find an older version any Intel software (suites, compilers, MKL libraries, etc...).

# Post Install
We need to build the FFTW3 interfaces for compilation of 3rd party software (ie. VASP).

```bash
#Unload openmpi, since this was built with GNU compilers
module unload openmpi

#Be sure this is the same version of intel where MKL lives
module load intel

# Go to MKL FFTW interface directory
cd ${MKL_ROOT}/mkl/interfaces/fftw3xf

# Build FFTW interfaces
make libintel64
```
