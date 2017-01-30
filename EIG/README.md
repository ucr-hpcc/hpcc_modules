# Install
obtained from https://data.broadinstitute.org/alkesgroup/EIGENSOFT/
```
Download and Uncompress
```
wget https://data.broadinstitute.org/alkesgroup/EIGENSOFT/EIG-6.1.4.tar.gz
tar zxf EID-6.1.4.tar.gz
```
Proceed with install
```
cd src
make clobber
make install

```

NOTES
=====

I had to edit the libs compiling to replace -lgsl with -lgsl -lcblas and add refs with -L/usr/lib64/atlas -L/usr/lib64

LDLIBS += -L/usr/lib64/atlas -L/usr/lib64 -lgslcblas -lgsl -lsatlas -lgfortran -lrt -Wl,-Bstatic -lm -Wl,-Bdynamic -fope
nmp

I also had to add  -llapacke to the compilation for '$(ED)/smartpca'
