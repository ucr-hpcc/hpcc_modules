Installed via conda. See issues 
https://github.com/etetoolkit/ete/issues/475
and
https://gitter.im/etetoolkit/ete?utm=

```
conda create -n ete3 -c etetoolkit ete_toolchain ete3

# however also requires us to further force the pip install due to missing files in the package
# specifically .../ete3-3.1.2-py3.7.egg/ete3/tools/ete_build.cfg
# this can be solved by forcing a pip install
conda activate ete3
pip install --force ete3

```
This pip install is preferred since it also allows the conda install ete_toolchain to still have been installed which installs dependencies like tcoffee, etc
