# Install
```
wget http:////www.almabte.eu/wp-content/uploads/2018/05/almabte-v1.3.1.tar.gz
tar -xf almabte-v1.3.1.tar.gz
cd almabte-v1.3.1
mkdir build
cd build
module load boost/1.68.0
module load cmake/3.12.3
export BOOST_LIBRARYDIR=/opt/linux/centos/7.x/x86_64/pkgs/boost/1.68.0/lib/
export BOOST_ROOT=/opt/linux/centos/7.x/x86_64/pkgs/boost/1.68.0/lib
cmake -DBOOST_ROOT=$BOOST_ROOT -DBOOST_LIBRARYDIR=$BOOST_LIBRARYDIR -DBoost_REALPATH=ON ../
make -j 4 all
make test
```
