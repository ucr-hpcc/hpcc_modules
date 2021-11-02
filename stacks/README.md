## Stacks

Stacks requires GCC 4.9+, use the latest GCC module to compile.

[Stacks Website](http://catchenlab.life.illinois.edu/stacks/)


### Download source
```bash
wget http://catchenlab.life.illinois.edu/stacks/source/stacks-2.3b.tar.gz
```

### Extract source
```bash
tar -zxvf stacks-2.3b.tar.gz
```

### Move into source dir
```bash
cd stacks-2.3b
```

### Set vars
```bash
SOFTNAME=stacks
VERSION=2.60_gcc-8.3.0
```

### Set modules
```bash
source /etc/profile.d/hpcc_modules.sh
module purge -s
module load -s base/gcc/8.3.0
```

### Configure
```bash
./configure --prefix=${HPCC_MODULES}/${SOFTNAME}/${VERSION}
```

### Build
```bash
  make
```

### Install
```bash
  make install
```
