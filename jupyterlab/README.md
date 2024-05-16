# JupyterLab

## Install

Use miniconda to install jupyterlab under individual directory:

```bash
module load miniconda3
conda create --prefix $HPCC_MODULES/jupyterlab/3.3.1 -c conda-forge jupyterlab=3.3.1
conda activate $HPCC_MODULES/jupyterlab/3.3.1
conda install -c conda-forge bash_kernel
```

## Module

Dont foget to add the `activate`/`deactivate` to the module:

```
if { [module-info mode load] || [module-info mode switch2] } {
        puts stdout "module load miniconda3; conda activate ${hpcc_modules}/jupyterlab/3.3.1;"
} elseif { [module-info mode remove] && ![module-info mode switch3] } {
        puts stdout "conda deactivate;"
}
```
