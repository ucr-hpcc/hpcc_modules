Installed by pip

```
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/pod5
cd /opt/linux/centos/8.x/x86_64/pkgs/pod5
conda create -p ./0.0.32 -c bioconda -c conda-forge python pip
conda activate /bigdata/operations/pkgadmin/opt/linux/centos/8.x/x86_64/pkgs/pod5/0.0.32
pip install pod5_format
pip install pod5_format_tools
```
