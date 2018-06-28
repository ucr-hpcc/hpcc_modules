## Install:
This should be run from within a 12 core interactive session ( srun -p short --mem=16g --ntasks=12 --pty bash -l )

```bash
USERNAME=$USER
cd /rhome/USERNAME/bigdata
git clone https://github.com/prisms-center/CASMcode.git
conda create -y -n casm-build-env python=2.7 scons boost scikit-learn deap pandas
source activate casm-build-env
cd /rhome/USERNAME/bigdata/CASMcode
module load boost/1.64.0
export CASM_BOOST_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/boost/1.64.0/
export CASM_PREFIX=/rhome/USERNAME/bigdata/casm
scons configure
scons -j 12 && scons install
/rhome/USERNAME/bigdata/casm/bin/casm
```


## subsequent logins:

```bash
module load boost/1.64.0
/rhome/USERNAME/bigdata/casm/bin/casm -h
```




## non-scons install

```bash
USERNAME=$USER
cd /rhome/USERNAME/bigdata
module load python
wget https://github.com/prisms-center/CASMcode/releases/download/v0.2.1/casm-v0.2.1.tar.gz
mkdir /rhome/USERNAME/bigdata/casm-src
tar -zxf casm-v0.2.1.tar.gz -C /rhome/USERNAME/bigdata/casm-src
cd /rhome/USERNAME/bigdata/casm-src/casm-v0.2.1
module load boost/1.64.0
./configure --with-boost=/opt/linux/centos/7.x/x86_64/pkgs/boost/1.64.0/ --prefix=/rhome/USERNAME/bigdata/casm-bin
make -j 8 && make install
/rhome/USERNAME/bigdata/casm-bin/bin/casm
```
