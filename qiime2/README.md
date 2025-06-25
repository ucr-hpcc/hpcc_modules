# Qiime2

Shotgun metagenome env renamed moshpit

## Environment File

Get environment file from Qiime website:

```bash
wget https://data.qiime2.org/distro/core/qiime2-2022.2-py38-linux-conda.yml
```

## Install

Use conda with environment file and `prefix` to install Qiime2:

```bash
conda env create --prefix $HPCC_MODULES/qiime2/2022.2 --file qiime2-2022.2-py38-linux-conda.yml
```

> Note: You cannot use the "-n" (name) flag, so the entire install path is the name.

## Create Module

Make sure that when activing within the module file that the full path is used as the conda environment name.
Use the `hpcc_modules` variable to define an absolute path, this keeps things simple and dynamic:

```tcl
if { [module-info mode load] || [module-info mode switch2] } {
        puts stdout "module load miniconda3; conda activate ${hpcc_modules}/qiime2/2022.2;"
} elseif { [module-info mode remove] && ![module-info mode switch3] } {
        puts stdout "conda deactivate;"
}
```

