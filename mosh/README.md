Installed from https://mosh.org/#getting

```
mkdir -p /opt/linux/centos/8.x/x86_64/src/m/mosh/
pushd /opt/linux/centos/8.x/x86_64/src/m/mosh/

wget https://mosh.org/mosh-1.4.0.tar.gz
tar zxf mosh-1.4.0.tar.gz
cd mosh-1.4.0
./configure --prefix=/opt/linux/centos/8.x/x86_64/pkgs/mosh/1.4.0 --enable-completion
make
make install
```
 

