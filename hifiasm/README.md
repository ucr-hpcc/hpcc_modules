```
mkdir -p /opt/linux/centos/8.x/x86_64/src/h/hifiasm/
cd /opt/linux/centos/8.x/x86_64/src/h/hifiasm/
git clone https://github.com/chhylp123/hifiasm hifiasm.gitcheckout
cd hifiasm.gitcheckout
make
mkdir -p  /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.25.0/bin
mkdir -p  /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.25.0/share/man/man1
rsync -a hifiasm /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.25.0/bin
rsync -a *.1 /opt/linux/centos/8.x/x86_64/pkg/hifiasm/0.25.0/share/man/man1
```
