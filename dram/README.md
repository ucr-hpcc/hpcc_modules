# DRAM

## Install

First request resources:

```bash
srun -p short -c 4 --mem=10g --pty bash -l
```

Create parent install dir:

```
mkdir /opt/linux/rhel/8.x/x86_64/pkgs/dram
```

Install using conda:

```bash
module load miniconda3
conda create -p /opt/linux/rhel/8.x/x86_64/pkgs/dram/1.3.4 -c conda-forge -c bioconda dram
```
