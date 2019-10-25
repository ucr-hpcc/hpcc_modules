# Open Babel

## Request Resources

```bash
srun -p short -c 4 --mem=10G --pty bash -l
```

## Download

```bash
cd /opt/linux/centos/7.x/x86_64/src
mkdir -p openbabel && cd openbabel
wget https://github.com/openbabel/openbabel/archive/openbabel-3-0-0.tar.gz
tar -zxvf openbabel-3-0-0.tar.gz
```

## Load dependencies

```bash
module unload miniconda2 # Use system python
module load cmake/3.15.4
module load swig/3.0.5
```

## Compile

```
cd openbabel-3.0.0
mkdir build
cd build
cmake ../ \
-DRUN_SWIG=ON \
-DPYTHON_BINDINGS=ON \
-DBOOST_ROOT=/opt/linux/centos/7.x/x86_64/pkgs/boost/1.68.0/ \
-DEIGEN3_INCLUDE_DIR=/opt/linux/centos/7.x/x86_64/pkgs/eigen/3.2.10/ \
-DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/3.0.0
make -j2
```

## Install

```bash
make install
```
