See https://github.com/zd1/telseq

```
module load bamtools
wget https://github.com/zd1/telseq/archive/v0.0.2.tar.gz
tar zxf v0.0.2.tar.gz
cd telseq-0.0.2/src

#run the cmds in autogen.sh - but there was some perl issue so I just ran on cmdline
set -ex
aclocal
autoconf
autoheader
automake -a

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/telseq/0.0.2
make
make install
```
