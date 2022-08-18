# pear 0.9.11 

Link to form for download [ [URL](https://www.h-its.org/downloads/pear-academic/)]

## Download

Download and stage source:

```
cd $HPCC_MODULES/../src
mkdir -p p/pear && cd pear
#copy tar ball to this dir
tar -zxvf pear-src-0.9.11.tar.gz
cd pear-src-0.9.11
```

## Prepare Env

Set compilers

```bash
export CC=$(which gcc)
export CXX=$(which g++)
```

## Configure

Run `./configure` script in src to generate make files:

```bash
./configure --prefix=/opt/linux/rocky/8.x/x86_64/pkgs/pear/0.9.11
```

## Build and Install

Then run make and install:

```bash
make && make install
```

