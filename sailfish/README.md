# Install
Download
```
wget https://github.com/kingsfordgroup/sailfish/archive/v0.8.0.tar.gz
```
Uncompress
```
mv v0.8.0.tar.gz sailfish-v0.8.0.tar.gz
tar -xf sailfish-v0.8.0.tar.gz
```
Prep and Build
```
cd sailfish
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/sailfish/0.8.0 -DFETCH_BOOST=TRUE ..
```
If the download step of libboost fails, edit the URL contained within the CMakeLists.txt file.
Then procceed with compiling and installing.
```
make && make install
```
