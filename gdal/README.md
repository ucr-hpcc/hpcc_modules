# GDAL Notes

GDAL was installed to support biodiverse/2.000 . Other software may benefit from other config options.

## Install GDAL

```bash
module load epsilon
module load libkml

export GDAL_VERSION=2.1.3

wget http://download.osgeo.org/gdal/${GDAL_VERSION}/gdal-${GDAL_VERSION}.tar.gz
tar -xf gdal-${GDAL_VERSION}.tar.gz
cd gdal-${GDAL_VERSION}
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/gdal/${GDAL_VERSION}
./configure --prefix /opt/linux/centos/7.x/x86_64/pkgs/gdal/${GDAL_VERSION} --with-liblzma --with-epsilon --with-poppler --with-armadillo
make -j4
make install
```
