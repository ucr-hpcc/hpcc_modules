# Install
> Note: Compiling on older processors (penguin/owl) will result in GCC illegal instruction error.

## Download
```bash
cd /opt/linux/centos/7.x/x86_64/src/
git clone https://github.com/atztogo/spglib.git
cd spglib/
```

## Environment
```bash
module unload miniconda2
module load ruby
module load cmake
```

## Compile & Install
```
mkdir build
cd build/
cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/spglib/1.9.8 ../
make -j 2
make install
```

## Fix Include
For some reason other software expects there to be a spglib direcotry that contains the header file.
So let's make one:
```bash
cd /opt/linux/centos/7.x/x86_64/pkgs/spglib/1.9.8/include/
mkdir spglib
cd spglib
ln -s ../spglib.h .
```
