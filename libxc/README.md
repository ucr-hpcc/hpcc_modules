# Install
Basic install, however the fPIC flag was required, or gpaw did not compile correctly.
```bash
VERSION=4.2.3
SOFTNAME=libxc
PREFIX=/opt/linux/centos/7.x/x86_64/pkgs/${SOFTNAME}/${VERSION}
MAKE_THREADS=2
export CFLAGS='-fPIC'
export CPPFLAGS='-fPIC'
export FCFLAGS='-fPIC'

./configure --prefix=$PREFIX
if [[ $? -eq 0 ]]; then make -j ${MAKE_THREADS}; fi
if [[ $? -eq 0 ]]; then make install; fi
```
