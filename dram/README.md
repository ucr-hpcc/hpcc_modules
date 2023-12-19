# DRAM

## Install

First request resources:

```bash
srun -p short -c 4 --mem=10g --pty bash -l
```

Create parent install dir:

```
mkdir -p ~/bigdata/pkgs/dram
```

Install using conda:

```bash
module load miniconda3
conda create -n ~/bigdata/pkgs/dram/1.4.6 -c conda-forge -c bioconda dram
```

## Database

Get a copy of the database, you can do this from their site, however that may take some time.
Or you can sync the database from the local HPCC copy:

```bash
rsync -rvP /srv/projects/db/DRAM/ ~/bigdata/DRAM_data
```

## Config

After your database is sync'ed then you need to update your `CONFIG` to point to the new database locations:

```bash
vim ~/bigdata/pkgs/dram/1.4.6/lib/python3.9/site-packages/mag_annotator/CONFIG
```

Be sure to update each path and version number of each entry.

## Test

At this point, everything should be installed, just actiate conda and run `DRAM-setup.py print_config` to test and make sure all the paths look good:

```bash
conda activate ~/bigdata/pkgs/dram/1.4.6
DRAM-setup.py print_config
```

