# Install Binary

Get the binary and place it under the proper `INSTALL_PATH`:

```bash
SALMON_VERSION=1.0.0
wget https://github.com/COMBINE-lab/salmon/releases/download/v${SALMON_VERSION}/Salmon-${SALMON_VERSION}_linux_x86_64.tar.gz
tar -xf Salmon-${SALMON_VERSION}_linux_x86_64.tar.gz
mv salmon-latest_linux_x86_64 $INSTALL_PATH/salmon/$SALMON_VERSION
```

There may be an error regarding `libm.so`, currently on CentOS 7, it is better to rename/remove this library from the salmon directory:

```bash
cd $INSTALL_PATH/salmon/$SALMON_VERSION/lib
mv libm.so libm.so.6_internal
```

# Install From Source
Download from https://github.com/COMBINE-lab/salmon/releases

Uncompress

```bash
mv v0.5.1.tar.gz salmon-v0.5.1.tar.gz
tar -xf salmon-v0.5.1.tar.gz
```

Prep and Build

```bash
cd salmon-0.5.1
mkdir build && cd build
```

You can build with an internal boost or the CentOS boost-static RPM:

```bash
# Use this cmake flag for internal boost -DFETCH_BOOST=TRUE
cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/salmon/0.5.1 ..
make && make install
```
