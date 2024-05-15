# OpenModelica Installation

**Replace "1.22.1" with the newer version that is being installed.**

Will need to clone the OpenModelica repo and checkout the version wanted
```
git clone --recurse-submodules https://github.com/OpenModelica/OpenModelica.git
cd OpenModelica
git checkout v1.22.1
git submodule update --force --init --recursive
```

GCC 12 needed to be used to compile, as without it a lot of C++17 features wouldn't compile
```
module load gcc/12
```

I used a Conda environment to store the dependencies of qt and qtwebkit
```
conda create -p $HPCC_MODULES/openmodelica/1.22.1/env
conda activate $HPCC_MODULES/openmodelica/1.22.1/env
mamba install -c conda-forge qt qtwebkit python=3.8   # Mamba solves the environment quicker
```

> Python 3.8 is for some libraries people use. If in the future people need other versions of python, I imagine we can create multiple OpenModelica modules, each with their own Python versions.

Compile it! I needed to help nudge cmake to use the correct gcc, g++, and gfortran binaries provided from gcc/12
```
CC=$(which gcc) GXX=$(which g++) FC=$(which gfortran) cmake -S . -B build_cmake -DOM_USE_CCACHE=OFF -DCMAKE_INSTALL_PREFIX=$HPCC_MODULES/openmodelica/1.22.1
cmake --build build_cmake --parallel $(nproc) --target install
```

Godspeed Soldier.

