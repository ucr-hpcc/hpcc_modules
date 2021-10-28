# xdrfile

Since this version is for plumed/cp2k we want to build with shared libraries:

```bash
module load extra GCC/8.3.0
make distclean && ./configure --enable-shared --prefix=/opt/linux/centos/7.x/x86_64/pkgs/xdrfile/1.1.4_gcc-8.3.0 && make && make test && make install 
```
