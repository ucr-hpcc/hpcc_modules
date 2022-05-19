# AMPtk

Installing this was a bit odd, conda timed out and failed with the following:

```bash
conda create -p $HPCC_MODULES/amptk/1.2.4 -c bioconda -c conda-forge amptk
```

Although, installing prerequisites first and then installing `amptk` via pip worked:

```bash
conda create -p $HPCC_MODULES/amptk/1.2
conda activate $HPCC_MODULES/amptk/1.2
conda install -c bioconda -c conda-forge biopython numpy pandas matplotlib
pip install amptk
```

## Databases

After installing, you need to install some basic databases:

```bash
amptk install -i ITS 16S LSU COI
```
