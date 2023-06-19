Compiled from https://github.com/lastz/lastz
```
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/lastz/1.04.22
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/lastz/1.04.22/docs
wget https://github.com/lastz/lastz/archive/refs/tags/1.04.22.tar.gz
tar zxf 1.04.22.tar.gz
cd lastz-1.04.22
make
make install LASTZ_INSTALL=/opt/linux/centos/8.x/x86_64/pkgs/lastz/1.04.22/bin
cp README* LICENSE /opt/linux/centos/8.x/x86_64/pkgs/lastz/1.04.22/docs
cp -r tools /opt/linux/centos/8.x/x86_64/pkgs/lastz/1.04.22/
```
