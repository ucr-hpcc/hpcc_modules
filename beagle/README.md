## Installed `beagle` via bioconda [ [URL](https://faculty.washington.edu/browning/beagle/b5_2.html) ]  

As `pkgadmin` define as outlined [here](https://github.com/ucr-hpcc/hpcc_modules#create-module) the variables 
`SOFT_NAME`, `SOFT_FIRST` and `SOFT_VER`. Next create directories as instructed under steps (3) and (5), and 
then run the following:

```sh
module load miniconda3
conda create -p $HPCC_MODULES/$SOFT_NAME/$SOFT_VER/env -c bioconda beagle
```
Included install of [ [beagle 4.1](https://faculty.washington.edu/browning/beagle/b4_1.html) ] via bioconda

```sh
module load miniconda3
conda create -p $HPCC_MODULES/beagle/4.1/env -c bioconda/label/cf201901 beagle
```

After this follow steps (7) - (17).

