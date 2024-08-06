From https://github.com/yaml/libyaml
```
mkdir -p /opt/linux/rocky/8.x/x86_64/src/y/libyaml
pushd /opt/linux/rocky/8.x/x86_64/src/y/libyaml
wget https://github.com/yaml/libyaml/releases/download/0.2.5/yaml-0.2.5.tar.gz
tar zxf yaml-0.2.5.tar.gz
cd yaml-0.2.5

./configure --prefix=/opt/linux/centos/8.x/x86_64/pkgs/libyaml/0.2.5
make
make install
```
