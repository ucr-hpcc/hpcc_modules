# Install
This installation is for cuda, version 2021 and beyond need a gcc with C++17
```bash
#run an interactive job on a gpu
srun -p gpu --gres=gpu:1 --cpus-per-task 8 --mem=10g --time=1:00:00 --pty bash -l
module load base/gcc/8.3.0
module load cmake/3.15.4
module load cuda/11.2
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${hpcc_modules}/gromacs/2021.2-cuda_gcc-8.3.0 \
    -DGMX_GPU=CUDA -DCUDA_TOOLKIT_ROOT_DIR=${hpcc_modules}/cuda/11.2/ \
    -DCMAKE_C_COMPILER=${hpcc_modules}/gcc/8.3.0/bin/gcc
```
