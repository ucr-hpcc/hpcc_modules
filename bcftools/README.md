# BCFtools

## Download

Visit http://www.htslib.org/download/ and find latest link to download.
Then download it like so:

```bash
wget https://github.com/samtools/bcftools/releases/download/1.15/bcftools-1.15.tar.bz2
``

## Install

Make sure htslib is already installed.
Then installing should be as easy as the following:

```bash
SOFT_NAME='htslib'
SOFT_VER='1.15'
./configure --with-htslib=$HPCC_MODULES/htslib/$SOFT_VER/ --prefix=$HPCC_MODULES/$SOFT_NAME/$SOFT_VER \
&& make install
```

