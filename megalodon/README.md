https://github.com/nanoporetech/megalodon

```
cd /opt/linux/8.x/centos/x86_64/pkg
mkdir -p megalodon
cd meaglodon
mamba create -p 2.5.0 -c conda-forge python==3.7
mamba create -p 2.5.0-gpu -c conda-forge python==3.7
conda activate /opt/linux/8.x/centos/x86_64/pkg/meaglodon/2.5.0
pip install ont-pyguppy-client-lib==6.2.1
cd /opt/linux/8.x/centos/x86_64/src/m
mkdir -p megalodon
cd megalodon
git clone https://github.com/nanoporetech/megalodon/
pip install -e megalodon
cd /opt/linux/8.x/centos/x86_64/src/b
mkdir -p butter-eel
cd butter-eel
git clone https://github.com/Psy-Fer/buttery-eel.git
pip install --upgrade pip
pip install --upgrade setuptools wheel
pip install -e buttery-eel

conda deactivate
conda activate /opt/linux/8.x/centos/x86_64/pkg/meaglodon/2.5.0-gpu
pip install ont-pyguppy-client-lib==6.2.1
cd /opt/linux/8.x/centos/x86_64/src/m/megalodon
pip install -e megalodon
pip install onnxruntime-gpu

cd /opt/linux/8.x/centos/x86_64/src/b/butter-eel
pip install --upgrade pip
pip install --upgrade setuptools wheel
pip install -e buttery-eel

```
