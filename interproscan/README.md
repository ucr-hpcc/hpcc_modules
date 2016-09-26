# interproscan

## Prep
https://github.com/ebi-pf-team/interproscan/wiki/HowToDownload
```
cd /opt/linux/centos/7.x/x86_64/src/
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.20-59.0/interproscan-5.20-59.0-64-bit.tar.gz{,.md5}
md5sum -c interproscan-5.20-59.0-64-bit.tar.gz.md5
```

## Compile
Not needed

## Install
https://github.com/ebi-pf-team/interproscan/wiki/HowToDownload
```
# Main Installation
cd /opt/linux/centos/7.x/x86_64/pkgs/interproscan/
tar -xpvf ../../src/interproscan-5.20-59.0-64-bit.tar.gz
mv interproscan-5.20-59.0 5.20-59.0
```

Create symlinks to third-party datasets
Packages: SignalP, Phobius, TMHMM
Use a previous version for reference

## Cleanup
```
# Load Java 8 if default version is older
module load java/8
# Run interproscan.sh to reveal any missing packages
/opt/linux/centos/7.x/x86_64/pkgs/interproscan/5.20-59.0/interproscan.sh
```

