# anaconda2

## Prep
```
SRCDIR=/opt/linux/centos/7.x/x86_64/src
PKGDIR=/opt/linux/centos/7.x/x86_64/pkgs/
[ -d $SRCDIR/anaconda2 ] || mkdir $SRCDIR/anaconda2
cd $SRCDIR/anaconda2
wget http://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh
```

## Compile
Not needed, software has self-installer.

## Install
```
sh Anaconda2-4.1.1-Linux-x86_64.sh
```
... Follow interactive shell installation prompts and point to appropriate dir.

## Cleanup
Check ~/.bashrc for lines added by Anaconda installer, remove lines and carry 
out instructions in module file instead.

Might be a good idea to unset PYTHONPATH for module load anaconda2 to avoid 
conflicts.
