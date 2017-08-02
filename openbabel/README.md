# Open Babel

## Prep
```
cd $SRCDIR
wget http://hivelocity.dl.sourceforge.net/project/openbabel/openbabel/2.3.2/openbabel-2.3.2.tar.gz
tar -zxvf openbabel-2.3.2.tar.gz
```

## Compile
Be sure to module load the appropriate Python version:
```
cd openbabel-2.3.2
mkdir build
cd build
cmake ../ -DPYTHON_BINDINGS=ON -DCMAKE_INSTALL_PREFIX:PATH=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2
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
