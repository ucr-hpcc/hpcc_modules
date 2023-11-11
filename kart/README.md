install via github and compile

```
mkdir -p /opt/linux/centos/8.x/x86_64/src/k/kart
cd /opt/linux/centos/8.x/x86_64/src/k/kart
git clone https://github.com/hsinnan75/Kart.git
cd Kart
make 
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/kart/2.5.6
rsync -a bin /opt/linux/centos/8.x/x86_64/pkgs/kart/2.5.6/
```
