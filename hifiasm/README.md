```
mkdir -p /opt/linux/centos/8.x/x86_64/src/h/hifiasm/
cd /opt/linux/centos/8.x/x86_64/src/h/hifiasm/
git clone https://github.com/chhylp123/hifiasm hifiasm.gitcheckout
cd hifiasm.gitcheckout
make
mkdir -p  /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.19.7/bin
mkdir -p  /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.19.7/share/man/man1
rsync -a hifiasm /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.19.7/bin
rsync -a *.1 /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.19.7/share/man/man1
```
