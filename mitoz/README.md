Installing via here
https://github.com/linzhi2013/MitoZ/blob/master/version_2.4-alpha/INSTALL.md

A Conda env was built in anaconda3

The Python code was installed in 
pkgs/mitoz/2.4-alpha which includes the .py file and a bin folder which has required scripts

This does require the user to install and update the NCBI taxonomy DB in their own folder.
This is reccomended for a user
```
mkdir ~/bigdata/etetoolkit
cd ~
ln -s /bigdata/stajichlab/$USER/etetoolkit ~/.etetoolkit
module load mitoz
python
>>> from ete3 import NCBITaxa
>>> ncbi = NCBITaxa()
>>> ncbi.update_taxonomy_database()
```
