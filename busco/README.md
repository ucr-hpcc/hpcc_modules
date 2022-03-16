# Busco

Native `conda` was not picking up latest version, or it would just hang.
So install using `mamba`.

```bash
module load miniconda3
mamba create -p /opt/linux/rhel/8.x/x86_64/pkgs/busco/5.3.0 -c conda-forge -c bioconda busco
```
