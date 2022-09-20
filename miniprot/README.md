miniprot for spliced alignment mapping of protein2genome (faster/better than Splan or genewise)
https://github.com/lh3/miniprot

```
VERSION=0.2
NAME=miniprot
mkdir -p /opt/linux/centos/8.x/x86_64/src/m/$NAME
pushd /opt/linux/centos/8.x/x86_64/src/m/$NAME
wget wget https://github.com/lh3/$NAME/archive/refs/tags/v${VERSION}.tar.gz
tar zxf v${VERSION}.tar.gz 
cd $NAME-$VERSION
make
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION/bin
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION/share/man/man1
rsync -a $NAME /opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION/bin
rsync -a $NAME.1 /opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION/share/man/man1
rsync -a README.md /opt/linux/centos/8.x/x86_64/pkgs/$NAME/$VERSION/share

```
