# BUSCO
BUSCO can be installed via conda. This would likely be the easiest, however some users have expressed the need for this software and the fact that the HPCC already provides an older version, as well as, the fact that it would eat into their own storage capacity.
Thus I have decided to install a non conda version.

## Dependencies
Requirements for BUSCO (check busco module file for required modules):
1. Python 3.3+ (2.7 is not supported by v4)
2. BioPython
3. tBLASTn 2.2+
4. Augustus 3.2
5. Prodigal
5. HMMER 3.1+
6. SEPP
7. R + ggplot2 

All non Python related software are installed as separate modules.
All Python related software is installed under a single busco package directory.
This way we can keep everything under a single Python environment.

### SEPP
Install SEPP under BUSCO install directory:
```
module load pyton/3.6.0
SRCDIR=/opt/linux/centos/7.x/x86_64/src/sepp
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/busco
export PYTHONPATH=${PKGDIR}/4.0.5/lib/python3.6/site-packages
cd $SRCDIR
wget https://github.com/smirarab/sepp/archive/4.3.10.tar.gz
tar -xf 4.3.10.tar.gz
cd sepp-4.3.10
python setup.py config -c
python setup.py install --prefix=${PKGDIR}/4.0.5
```

## Preparation
Make sure we have to source code and properly configured environment:
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src/busco
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/busco
module load pyton/3.6.0
export PYTHONPATH=${PKGDIR}/4.0.5/lib/python3.6/site-packages
cd $SRCDIR
wget https://gitlab.com/ezlab/busco/-/archive/4.0.5/busco-4.0.5.tar.gz
tar -zxvf busco-4.0.5.tar.gz
cd busco-4.0.5
[ -d $PKGDIR ] || mkdir $PKGDIR
```

## Configure
Update the `config/myconfig.ini` file with the correct paths to required software.
Previous versions of BUSCO should be very similar.

## Install
Build and install BUSCO into PKGDIR:
```
python setup.py install --${PKGDIR}/4.0.5
cp -r scripts $PKGDIR/scripts
cp -r config $PKGDIR/config
```

## Test
