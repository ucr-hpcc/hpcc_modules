Downloaded from http://research-pub.gene.com/gmap/
built on x02, i10, and c10 machines to support compilation with different simd flags, the tool will dynamically choose appropriate vector compile app for the processor it is running on.

```
cd  /bigdata/operations/pkgadmin/opt/linux/centos/8.x/x86_64/src/g/gmap/
wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2023-04-28.tar.gz
tar zxf gmap-gsnap-2023-04-28.tar.gz
./configure --prefix=/opt/linux/centos/8.x/x86_64/pkgs/gmap/2023-04-28
make -j 24
make install
```
