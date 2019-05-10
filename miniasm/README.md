# Install
Miniasm- https://github.com/lh3/miniasm/
Ultrafast de novo assembly for long noisy reads (though having no consensus step)
```
```
Download and Uncompress
```
wget https://github.com/lh3/miniasm/archive/v0.3.tar.gz
cd miniasm-0.3
make
cd tex
make
cd ..
```
Proceed with install
```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/miniasm/0.3/bin
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/miniasm/0.3/share/man/man1
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/miniasm/0.3/share/doc

rsync -a miniasm minidot /opt/linux/centos/7.x/x86_64/pkgs/miniasm/0.3/bin
rsync -a tex/miniasm.pdf *.md /opt/linux/centos/7.x/x86_64/pkgs/miniasm/0.3/share/doc/
rsync -a *.1 /opt/linux/centos/7.x/x86_64/pkgs/miniasm/0.3/share/man/man1

```
