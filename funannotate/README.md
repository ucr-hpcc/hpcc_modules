install via conda package `conda install -c bioconda -c conda-forge funannotate`

also need to explictly install
```
conda install -c bioconda perl-file-which perl-local-lib
```

installed as separate module load packages
* CodingQuarry 

genemarkESET is installed by adding the folder to the PATH but since it requires perl modules in the env it cannot be loaded with a module.
signalP is installed directly into the module by doing this:
```
BASE=/opt/linux/centos/8.x/x86_64/src/s/signalp/signalp6_fast
pip install $BASE/signalp-6-package
SIGNALP_DIR=$(python3 -c "import signalp; import os; print(os.path.dirname(signalp.__file__))" )
rsync -a --progress $BASE/signalp-6-package/models/* $SIGNALP_DIR/model_weights/
```

we also set some env variables to support how funannotate runs `TRINITYHOME=${hpcc_modules}/funannotate/1.8/env/opt/trinity-2.8.5` 
and
`setenv		EVM_HOME	${hpcc_modules}/funannotate/1.8/env/bin`
