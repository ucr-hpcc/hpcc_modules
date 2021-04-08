Could not deal with source install - here I did a conda install. Maybe in retrospec we should have called it busco-5 so that we could just upgrade this env when new releases are made...

```
conda create -n busco-5.0.0
conda activate busco-5.0.0
conda install conda
which conda
  /opt/linux/centos/7.x/x86_64/pkgs/miniconda3/4.3.31/envs/busco-5.0.0/bin/conda
conda -V
  conda 4.9.2
conda install -c bioconda -c conda-forge busco=5.0.0
```
