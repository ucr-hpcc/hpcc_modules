Built from source
https://mafft.cbrc.jp/alignment/software/source.html

```
cd /opt/linux/centos/8.x/x86_64/src/m/mafft/
wget https://mafft.cbrc.jp/alignment/software/mafft-7.505-with-extensions-src.tgz
tar zxf mafft-7.505-with-extensions-src.tgz
cd mafft-7.505-with-extensions-src
module load golang
cd core
# edit Makefile to enable
# DASH_CLIENT = dash_client
# set PREFIX = /opt/linux/centos/8.x/x86_64/pkgs/mafft/7.505
make clean
make -j8
make install
cd ../extensions
# edit Makefile to update
# set PREFIX = /opt/linux/centos/8.x/x86_64/pkgs/mafft/7.505
make clean
make -j8
make install
```
