https://github.com/lh3/bwa
```
cd bwa; make
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/lib/
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/bin
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/share/man/man1
rsync -a *.a /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/lib/
rsync -a bwa /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/bin
rsync -a bwakit /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/
rsync -a *.1 /opt/linux/centos/8.x/x86_64/pkgs/bwa/0.7.19/share/man/man1


```
