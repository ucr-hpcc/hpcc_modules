# Install
For some reason this required a newer version of cmake
```
export PATH=/opt/linux/centos/7.x/x86_64/pkgs/cmake/3.4.0/bin:$PATH
```
Download and Uncompress
```
wget https://github.com/pachterlab/kallisto/archive/v0.43.1.tar.gz
mv v0.43.1.tar.gz kallisto_linux-v0.42.4_src.tar.gz
tar -xf kallisto_linux-v0.43.1_src.tar.gz
```
Proceed with install
```
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/kallisto/0.43.1 ..
make && make install
```
