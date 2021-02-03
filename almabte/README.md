# Install AlamBTE

First request a job to build software:

```bash
srun -p short -c 4 --mem=10g --pty bash -l
```

After job has been allocated, create directory where software will live and move into it:

```bash
mkdir -p ~/bigdata/software/
cd ~/bigdata/software/
```

Then download the software and extract it:

```bash
wget http:////www.almabte.eu/wp-content/uploads/2018/05/almabte-v1.3.1.tar.gz
tar -xf almabte-v1.3.1.tar.gz
cd almabte-v1.3.1
```

Create build directory:

```bash
mkdir build
cd build
```

Set PATHs for BOOST:

```
module load boost/1.68.0
module load cmake/3.12.3

export BOOST_ROOT=/opt/linux/centos/7.x/x86_64/pkgs/boost/1.68.0/
export BOOST_LIBRARYDIR=${BOOST_ROOT}/lib/
```

Compile software:

```bash
cmake -DBOOST_ROOT=${BOOST_ROOT} -DBOOST_LIBRARYDIR=${BOOST_LIBRARYDIR} -DBoost_REALPATH=ON ../
make -j 4 all
```

Finally, run tests:

```bash
make test
```
