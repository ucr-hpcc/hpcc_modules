# CD-Hit

Conda environment was created with perl.

# Prep

Load basics:

```
module purge
module load slurm
module load miniconda3
conda activate $HPCC_MODULES/cd-hit/4.8.1/env
```

# Modify

Modify Makefile.PL by adding includes paths `$HPCC_MODULES/cd-hit/4.8.1/env/include`.

# Build

```
perl Makefile.PL \
CC=x86_64-conda_cos6-linux-gnu-gcc \
INSTALL_BASE=$HPCC_MODULES/cd-hit/4.8.1/env/ \
&& make \
&& make install
```

