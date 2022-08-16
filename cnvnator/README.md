Installed by conda/mamba

```
cd /opt/linux/centos/8.x/x86_64/pkgs/
mkdir cnvnator
module load miniconda3
mamba create -p ./0.4.1 -c bioconda -c conda-forge cnvnator
conda activate ./0.4.1
mamba install -c bioconda -c conda-forge cnvpytor
```
