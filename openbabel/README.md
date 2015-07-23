# Open Babel

## Prep
```
cd $SRCDIR
wget http://hivelocity.dl.sourceforge.net/project/openbabel/openbabel/2.3.2/openbabel-2.3.2.tar.gz
tar -zxvf openbabel-2.3.2.tar.gz
cd openbabel-2.3.2
mkdir build
cd build
```

## Compile
Be sure to module load the appropriate Python version:
```
cmake ../openbabel-2.3.2 -DPYTHON_BINDINGS=ON
make -j2
```

## Install
```
make install
```

## Cleanup
```
cd ~/
rm -rf /tmp/compileOB
```
