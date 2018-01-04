# Singularity Build Instructions

Tested on version 2.4.2

## (As pkgadmin) Download, configure, build, and install

```bash
wget https://github.com/singularityware/singularity/releases/download/${PKGVER}/singularity-${PKGVER}.tar.gz
tar -xf singularity-$(PKGVER}.tar.gz
cd singularity-${PKGVER}

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}

make
make install
```

## (As a sudo user) Fix permissions

```bash
sudo chown -Rv --no-dereference root:root /opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}
cd /opt/linux/centos/7.x/x86_64/pkgs/singularity/${PKGVER}/libexec/singularity/bin/
sudo chmod u+s action-suid mount-suid start-suid
```
