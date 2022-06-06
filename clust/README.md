## Installed [clust](https://github.com/BaselAbujamous/clust) via bioconda 

As `pkgadmin` define as outlined [here](https://github.com/ucr-hpcc/hpcc_modules#create-module) the variables 
`SOFT_NAME`, `SOFT_FIRST` and `SOFT_VER`. Next create directories as instructed under steps (3) and (5), and 
then run the following:

```sh
module load miniconda3
conda create -p $HPCC_MODULES/$SOFT_NAME/$SOFT_VER/env -c bioconda clust
```

After this follow steps (7) - (17).

