# OpenBabel

Use native `gcc` and `cmake` (ie RPM).

## Download

Download and stage source:

```
cd $HPCC_MODULES/../src
mkdir -p o/openbabel && cd openbabel
wget https://github.com/openbabel/openbabel/archive/openbabel-3-1-1.tar.gz
tar -zxvf openbabel-3-1-1.tar.gz
cd openbabel-3-1-1
```

## Prepare Env

Load java

```bash
module load java
```

Ensure build dir is clean

```bash
rm -rf build
mkdir build
cd build
```

Set compilers

```bash
export CC=$(which gcc)
export CXX=(which g++)
```

We used native OS boost, however at some point if an external boost was needed, you could add the following `cmake` flag:
```
-DBOOST_ROOT=${BOOST_ROOT} \
```

We also used the native OS `python3`, but you could use an external path for `python3` if you wanted:

```bash
PATHON3_EXEC=$(which python3)
```

> Note: If using external `zlib` and `eigen3` libraries is more optimal, one could also update those paths in the `cmake` command.

## Configure

Run `cmake` to generate make files:

```bash
cmake ../ \
-DRUN_SWIG=ON \
-DJAVA_BINDINGS=ON \
-DPYTHON_BINDINGS=ON \
-DPYTHON_EXECUTABLE=$PYTHON3_EXEC \
-DZLIB_LIBRARY=/usr/lib64/libz.so.1.2.11 \
-DZLIB_INCLUDE_DIR=/usr/include \
-DEIGEN3_INCLUDE_DIR=/usr/include/eigen3 \
-DCMAKE_INSTALL_PREFIX=/opt/linux/rhel/8.x/x86_64/pkgs/openbabel/3.1.1
```

## Build and Install

Then run make and install:

```bash
make -j2 && make install
```

