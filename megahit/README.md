install from https://github.com/voutcn/megahit

```
mkdir -p /opt/linux/rocky/8.x/x86_64/src/m/megahit
mkdir -p /opt/linux/rocky/8.x/x86_64/pkg/megahit/1.2.9
pushd /opt/linux/rocky/8.x/x86_64/src/m/megahit
wget https://github.com/voutcn/megahit/releases/download/v1.2.9/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz
tar zvxf MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz
mv MEGAHIT-1.2.9-Linux-x86_64-static/bin /opt/linux/rocky/8.x/x86_64/pkg/megahit/1.2.9
```
