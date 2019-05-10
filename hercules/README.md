# Install
Hercules - https://github.com/BilkentCompGen/Hercules
Profile HMM-based hybrid error correction algorithm for long reads
```
```
Download and Uncompress
```
git clone https://github.com/BilkentCompGen/hercules.git
module load miniconda3
conda activate gcc_5
cd hercules/src
# edit the Makefile to use 
# CXX=x86_64-conda_cos6-linux-gnu-g++
# also had to go in and build bzip2 in ../util/ so it used the same compiler version
make
```
Proceed with install
```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/hercules/2017-Nov/bin
rsync ../bin/hercules /opt/linux/centos/7.x/x86_64/pkgs/hercules/2017-Nov/bin
```
