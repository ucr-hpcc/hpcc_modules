# Install

```
tool=bwa-mem2
VERSION=2.2.1
mkdir -p src/b/bwa-mem2
pushd src/b/bwa-mem2
git clone --recursive https://github.com/bwa-mem2/bwa-mem2 $NAME
# for release compiled
curl -L -O https://github.com/$tool/$tool/releases/download/v$VERSION/$tool-${VERSION}_x64-linux.tar.bz2
tar jxf $NAME-${VERSION}_x64-linux.tar.bz2
# end for release compiled
#cd $NAME-$VERSION
cd $tool
BASE=/opt/linux/centos/8.x/x86_64/pkgs/$tool/$VERSION
module load oneapi
make CXX=icpc multi
rsync -a $tool ${tool} ${tool}.* $BASE
```
