# Install
Minimap2- https://github.com/lh3/minimap2/
A fast sequence mapping and alignment program - 
It is a "fast sequence mapping and alignment program that can find overlaps between long noisy reads, or map long reads or their assemblies to a reference genome optionally with detailed alignment (i.e. CIGAR). At present, it works efficiently with query sequences from a few kilobases to ~100 megabases in length at an error rate ~15%."
```
```
Download and Uncompress
```
wget https://github.com/lh3/minimap2/releases/download/v2.0/minimap2-2.0.tar.bz2
cd minimap2-2.0
make
```
Proceed with install
```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/minimap2/2.0
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/minimap2/2.0/bin
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/minimap2/2.0/share/man/man1

rsync -a minimap2 /opt/linux/centos/7.x/x86_64/pkgs/minimap2/2.0/bin
rsync -a README.md /opt/linux/centos/7.x/x86_64/pkgs/minimap2/2.0/share
rsync -a *.1 /opt/linux/centos/7.x/x86_64/pkgs/minimap2/2.0/share/man/man1

```
