https://github.com/rega-cev/virulign

```
wget https://github.com/rega-cev/virulign/archive/v1.0.1.zip
unzip v1.0.1.zip
cd virulign/1.0.1
mkdir -p build
cd build
cmake ../
make
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/virulign/1.0.1/bin/
cp -r src/virulign /opt/linux/centos/7.x/x86_64/pkgs/virulign/1.0.1/bin/
cd ..
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/virulign/1.0.1/share/doc
rsync -a references /opt/linux/centos/7.x/x86_64/pkgs/virulign/1.0.1/share
rsync -a README.md LICENSE.txt /opt/linux/centos/7.x/x86_64/pkgs/virulign/1.0.1/share/doc
```
