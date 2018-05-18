# Singularity Build Instructions

## Version 2.5.1

### (As a user with sudo) Download, configure, and build, and install

`--localstatedir` is necessary because Singularity stores some state information in the filesystem.
In an HPC environment, this directory can't be on a shared filesystem, so we specify a directory
that is local on every node. There's a related Puppet module to create the relevant subdirectories.

`sudo` is necessary because Singularity is a root-owned setuid program.

`/usr/sbin` needs to be in the path for `mksquashfs`.

```bash
wget https://github.com/singularityware/singularity/releases/download/${PKGVER}/singularity-${PKGVER}.tar.gz
tar -xf singularity-$(PKGVER}.tar.gz
cd singularity-${PKGVER}

sudo mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}
export PATH=$PATH:/usr/sbin
./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER} --localstatedir=/var

make
sudo make install
```

## Version 2.4.2

### (As pkgadmin) Download, configure, build, and install

```bash
wget https://github.com/singularityware/singularity/releases/download/${PKGVER}/singularity-${PKGVER}.tar.gz
tar -xf singularity-$(PKGVER}.tar.gz
cd singularity-${PKGVER}

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}

make
make install
```

### (As a sudo user) Fix permissions

```bash
sudo chown -Rv --no-dereference root:root /opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}
cd /opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}/libexec/singularity/bin/
sudo chmod u+s action-suid mount-suid start-suid
```
