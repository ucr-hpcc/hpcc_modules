# Install Binary

Get the binary and place it under the proper `INSTALL_PATH`:

```
SALMON_VERSION=1.0.0
wget https://github.com/COMBINE-lab/salmon/releases/download/v${SALMON_VERSION}/Salmon-${SALMON_VERSION}_linux_x86_64.tar.gz
tar -xf Salmon-${SALMON_VERSION}_linux_x86_64.tar.gz
mv salmon-latest_linux_x86_64 $INSTALL_PATH/salmon/$SALMON_VERSION
```

# Install From Source
Download from https://github.com/COMBINE-lab/salmon/releases

Uncompress
```
mv v0.5.1.tar.gz salmon-v0.5.1.tar.gz
tar -xf salmon-v0.5.1.tar.gz
```
Prep and Build
```
cd salmon-0.5.1
mkdir build && cd build
```
You can build with an internal boost or the CentOS boost-static RPM:
```
# Use this cmake flag for internal boost -DFETCH_BOOST=TRUE
cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/salmon/0.5.1 ..
make && make install
```
