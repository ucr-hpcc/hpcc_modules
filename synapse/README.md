### Installation
You will need to load miniconda3 first before attempting to install synapse

```bash
conda create -n synapse
conda activate synapse
conda install python=3
conda install -c bioconda synapseclient
# Optional install
conda install pandas
# For some reason this package will downgrade synapse to an older version
# This is left off on the install
conda install -c bioconda pysftp
```

See http://python-docs.synapse.org/build/html/index.html#installation for more installation detail
