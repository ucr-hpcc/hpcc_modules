# Install
First you must build spglib, since you will need libs and headers from it.

# Download
```bash
wget -O thirdorder-v1.1.1-8526f47.tar.bz2 http://www.shengbte.org/downloads/thirdorder-v1.1.1-8526f47.tar.bz2?attredirects=0&d=1
tar -xf thirdorder-v1.1.1-8526f47.tar.bz2
cd thirdorder
```

## Configure
Modify the `setup.py` script to note the following spglib paths:
```python
INCLUDE_DIRS = ['/opt/linux/centos/7.x/x86_64/pkgs/spglib/1.9.8/include']
LIBRARY_DIRS = ['/opt/linux/centos/7.x/x86_64/pkgs/spglib/1.9.8/lib']
```

Since this is installed as a Python module and will be installed under the current version of Python, you will need to modify the compile.sh script to reflect the correct version of Python where you want the thirdorder module to be installed.
```bash
#!/bin/bash -l

# Here is an example of how you could select a custom python environment under conda
# More information regarding creating environments can be found here: 
#   http://hpcc.ucr.edu/manuals_linux-cluster_package-manage.html#virtual-environments
#module unload miniconda2
#module load anaconda3
#source thirdorder

which python
python setup.py build --build-lib=. --build-platlib=.
```

## Compile
Next, run the compile script:
```bash
./compile.sh
```
