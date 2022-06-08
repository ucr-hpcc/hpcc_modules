From https://github.com/ruanjue/wtdbg2

```
git clone https://github.com/ruanjue/wtdbg2
cd wtdbg2 && make
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/wtdbg2/2.5/bin
rsync -a kbm2  pgzf  wtdbg-cns  wtdbg2  wtdbg2.pl  wtpoa-cns /opt/linux/centos/8.x/x86_64/pkgs/wtdbg2/2.5/bin/
rsync -a scripts /opt/linux/centos/8.x/x86_64/pkgs/wtdbg2/2.5/
rsync -a *.md *.txt /opt/linux/centos/8.x/x86_64/pkgs/wtdbg2/2.5/share/
```
