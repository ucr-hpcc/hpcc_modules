https://github.com/stajichlab/AAFTF
Automatic Assembly For The Fungi

```
mkdir -p /opt/linux/centos/8.x/x86_64/src/a/AAFTF
cd /opt/linux/centos/8.x/x86_64/src/a/AAFTF
curl -L -O https://github.com/stajichlab/AAFTF/archive/refs/tags/v0.3.0.tar.gz
tar zxf v0.3.0.tar.gz
cd AAFTF-0.3.0
conda create -p /opt/linux/centos/8.x/x86_64/pkgs/AAFTF/0.3.0/env -c bioconda biopython
source activate /opt/linux/centos/8.x/x86_64/pkgs/AAFTF/0.3.0/env
pip install .
```
