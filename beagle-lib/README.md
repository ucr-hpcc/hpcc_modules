# Beagle-Lib

# Prep

Request a job on a GPU node:

```bash
srun -p gpu --gres=gpu:1 -c 4 --mem=10g --time=1:00:00 --pty bash -l
```

Load dep modules:

```bash
module load java/17.0.2
module load cuda/11.4
```

# Download

Some required files are missing from the `tar`/`zip` releases of beagle-lib, so we must use a git checkout:

```bash
mkdir -p ${HPCC_MODULES}/../src/b/beagle-lib && cd ${HPCC_MODULES}/../src/b/beagle-lib
git clone --depth=1 https://github.com/beagle-dev/beagle-lib.git beagle-lib.git
```

# Configure

```bash
cd beagle-lib.git
cmake -DCMAKE_INSTALL_PREFIX:PATH=${HPCC_MODULES}/beagle-lib/3.1.2 ..
```

# Build and Install

```bash
make install
```
