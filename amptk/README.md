Install
1. make a conda env with version (eg `conda create -n amptk-1.5.4 mambda`) - usually within miniconda3
2. `conda activate amptk-1.5.4` or `source activate amptk-1.5.4`)
3. download amptk package
```
cd /opt/linux/centos/7.x/x86_64/pkgs/amptk
wget https://github.com/nextgenusfs/amptk/archive/refs/tags/v1.5.4.tar.gz
tar zxf v1.5.4.tar.gz
mv amptk-1.5.4 1.5.4
cd 1.5.4
pip install .
```
4. The dependencies are already installed but requires vsearch
