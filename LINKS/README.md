# LINKS
https://github.com/bcgsc/LINKS/
Note that due to some issues with compilation of the swig code - this only works if you are using system installed perl. so ``module unload perl`` is warranted
## Prep
``` 
wget https://github.com/bcgsc/LINKS/releases/download/v2.0.1/links-v2.0.1.tar.gz
```

## Compile
```
tar zxf links-v2.0.1.tar.gz
cd links-2.0.1/
./configure --prefix=/opt/linux/rocky/8.x/x86_64/pkgs/links/2.0.1
make
```

## Install
```
make install
```

## Cleanup
```
```
