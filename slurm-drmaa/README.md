slurm drmaa library https://github.com/natefoo/slurm-drmaa

```
mkdir -p /opt/linux/centos/8.x/x86_64/src/s/slurm-drmaa
pushd /opt/linux/centos/8.x/x86_64/src/s/slurm-drmaa
wget https://github.com/natefoo/slurm-drmaa/releases/download/1.1.3/slurm-drmaa-1.1.3.tar.gz
wget https://github.com/natefoo/slurm-drmaa/releases/download/1.1.3/slurm-drmaa-1.1.3.tar.gz.sha512
tar zxf slurm-drmaa-1.1.3.tar.gz
cd slurm-drmaa-1.1.3
# not sure if this should be 21.08.8 or 21.08.8
SLURM=/opt/linux/rocky/8.x/x86_64/pkgs/slurm/21.08.5

./configure --prefix=/opt/linux/centos/8.x/x86_64/pkgs/slurm-drmaa/1.1.3 \
  --with-slurm-lib=$SLURM/lib --with-slurm-inc=$SLURM/include
make
make install
```
