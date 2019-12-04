# Binaries
Normally we would just download the binaries from here: [http://cab.spbu.ru/software/spades/](http://cab.spbu.ru/software/spades/)

It is simple enough to uncompress and place them where needed.

# Source
## Request Job
Compiling this software requires more resources, so let's request a job first:
```bash
srun -p batch -c 8 --mem=10g --pty bash -l
```
Your node must be on batch since GCC 6.3.0 only works from a batch node.

## Get Software
Download and uncompress:
```bash
wget http://cab.spbu.ru/files/release3.13.2/SPAdes-3.13.2.tar.gz
tar -xf SPAdes-3.13.2.tar.gz
cd SPAdes-3.13.2
```

## Install
Load modules:
```bash
module load cmake/3.15.4
module load extra GCC/6.3.0-2.27
```

Set non-standard compiler:
```bash
export CC=/opt/linux/centos/7.x/x86_64/easybuild/pkgs/GCCcore/6.3.0/bin/gcc
export CXX=/opt/linux/centos/7.x/x86_64/easybuild/pkgs/GCCcore/6.3.0/bin/g++
```

Set install location:
```bash
export PREFIX=/bigdata/operations/shared/software/SPAdes/3.13.0
```

Set building directories:
```bash
BUILD_DIR=build_spades
BASEDIR=`pwd`/
```

Remove old build:
```bash
rm -rf "$BASEDIR/$BUILD_DIR"
```

Make new build directory and move into it:
```
mkdir -p "$BASEDIR/$BUILD_DIR"
cd "$BASEDIR/$BUILD_DIR"
```

Configure normally:
```bash
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$PREFIX" $* "$BASEDIR/src"
```

Or, configure with higher MAX_K (specific user requested):
```
cmake -G "Unix Makefiles" -DSPADES_MAX_K=251 -DCMAKE_INSTALL_PREFIX="$PREFIX" $* "$BASEDIR/src"
```

Compile new build using 8 threads:
```bash
make -j 8
make install
cd $PREFIX
```

