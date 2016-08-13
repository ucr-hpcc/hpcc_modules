# Install
Download from https://github.com/abyzovlab/CNVnator/releases
Uncompress
```
wget https://github.com/abyzovlab/CNVnator/archive/v0.3.2.tar.gz
tar zxf v0.3.2.tar.gz 
```
compile
```
module load root
module load yepp
cd src
ln -s ../../samtools-1.3 ./samtools # link to built samtools binaries (needs libsam.a)
cd ..
ln -s src/samtools ./
make
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/cnvnator/0.3.2
mv cnvnator /opt/linux/centos/7.x/x86_64/pkgs/cnvnator/0.3.2
```
