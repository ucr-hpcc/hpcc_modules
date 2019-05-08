# Gaussian

Our university has a Gaussian campus site license. The software can be downloaded via sftp. Contact ITS for more details.

## Download

Be sure to download the correct SSE version.

```bash
sftp to.some.host
get G09.tar
```

## Install
```bash
tar -xf G09.tar
INSTALL_PATH=/opt/linux/centos/7.x/x86_64/pkgs/gaussian
mv g09 ${INSTALL_PATH}/9_SSE4
```
