Installed conda env DRAM-1.2.3

```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/DRAM
cd /opt/linux/centos/7.x/x86_64/pkgs/DRAM
git clone https://github.com/shafferm/DRAM.git 1.2.3
cd 1.2.3
conda create -n DRAM-1.2.3 mamba python=3.*
conda activate DRAM-1.2.3
mamba install pandas pytest scikit-bio sqlalchemy altair openpyxl networkx ruby parallel
pip install .
```
