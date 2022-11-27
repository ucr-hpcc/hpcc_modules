Installed by pip

```
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/pod5
cd /opt/linux/centos/8.x/x86_64/pkgs/pod5
conda create -p ./0.0.41 -c bioconda -c conda-forge python=3.10 pip
conda activate /bigdata/operations/pkgadmin/opt/linux/centos/8.x/x86_64/pkgs/pod5/0.0.41
pip install pod5_format
pip install pod5_format_tools
```
