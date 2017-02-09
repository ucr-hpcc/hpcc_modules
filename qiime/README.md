#QIIME
##Prep
Install a custom version of Python under opt:
```
./configure \
--prefix=/opt/linux/centos/7.x/x86_64/pkgs/python/2.7.12 \
--enable-shared \
--enable-unicode=ucs4
make && make install
```
This Python is the base for QIIME and possibly other virtualenvs.

Install ipython, virtualenv and pip...nothing else.
It is best to keep installs here to a minimum, since this is a base install that can be used in multiple independent environemnts.
Install QIIME environment within a sandbox:
```
cd /opt/linux/centos/7.x/x86_64/pkgs/python/2.7.12/
virtualenv --always-copy qiime-env
```
##Install
Activate QIIME environment and install qiime module:
```
source /opt/linux/centos/7.x/x86_64/pkgs/python/2.7.12/qiime-env/bin/activate
pip install numpy
pip install qiime
```
per this error: https://groups.google.com/forum/#!topic/qiime-forum/oYRbAloXTrQ

I had to edit:
```
/opt/linux/centos/7.x/x86_64/pkgs/python/2.7.12/qiime-env/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc
backend: qt4agg 
```
to
```
backend: agg 

An alternative is to do 
https://groups.google.com/forum/#!searchin/qiime-forum/.matplotlibrc/qiime-forum/6srHDScyh_0/CJeu_Xl4BgAJ
and basically create a file
~/.config/matplotlib/matplotlibrc

and add the following:
backend : agg
```
##Module
Add specialized block to activate/deactivate when qiime module is loaded/unloaded.
As a environement module the virtualenv activate does not fully function for QIIME.
So add original Python libs to the LD_LIBRARY_PATH under module.

Also add QIIME_CONFIG_FP environment variable, so that global settings could be applied to all users:
```
/opt/linux/centos/7.x/x86_64/pkgs/python/2.7.12/qiime-env/.qiime_config
```
Users can also add more customizations under their own ~/.qiime_config and use both of these configs.
