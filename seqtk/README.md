Downloaded src code from https://github.com/lh3/seqtk

```
pushd /opt/linux/centos/8.x/x86_64/src/s/seqtk
https://github.com/lh3/seqtk/archive/refs/tags/v1.4.tar.gz
tar zxf v1.4.tar.gz
cd seqtk-1.4
# I did modify compilation to remove -g flag but this is optional
make
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/seqtk/1.4/bin/
rsync -av seqtk /opt/linux/centos/8.x/x86_64/pkgs/seqtk/1.4/bin/
```
