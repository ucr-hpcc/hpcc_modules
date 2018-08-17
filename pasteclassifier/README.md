# PASTEClassifier Notes

## Setup a pip environment
```
$ module purge # or unload other python, miniconda, etc.
$ module load python/2.7.13-venv
$ mkdir /opt/linux/centos/7.x/x86_64/pkgs/pasteclassifier
$ cd /opt/linux/centos/7.x/x86_64/pkgs/pasteclassifier
$ virtualenv 1.0 # or whatever version
$ source /opt/linux/centos/7.x/x86_64/pkgs/pasteclassifier/1.0/bin/activate
$ pip install MySQL-python pyaml
```

## Extract PASTEClassifier into place
```
$ cd /opt/linux/centos/7.x/x86_64/pkgs/pasteclassifier/1.0
$ tar -xv --strip-components=1 -f /opt/linux/centos/7.x/x86_64/src/PASTEClassifier-1.0.tar.gz
```
