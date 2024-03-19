# DFTB+


## Version v23.1

Update any occurance of "23.1" to the newest version to be installed.
```
module purge
module load gcc/9.2.1
module load openmpi/4.1.2_slurm-23.02.2_mpi1-compat
module load elsi/2.9.1
module load slurm/23.02.2
vim config.cmake # Set WITH_MPI to TRUE and (optionally) TEST_MPI_PROCS and TEST_OMP_THREADS to 2
FC=mpifort CC=mpicc cmake -DCMAKE_PREFIX_PATH="/opt/linux/rocky/8.x/x86_64/pkgs/scalapack/2.2.0" -DCMAKE_INSTALL_PREFIX=$HPCC_MODULES/dftbplus/23.1 -B _build .
cmake --build _build -- -j $(nproc)
pushd _build
ctest -j4
popd
cmake --install _build
```
## Future Thoughts

For future compilations, might be a good idea to compile with the following options:
- BUILD_SHARED_LIBS
- ENABLE_DYNAMIC_LOADING
- WITH_PYTHON
