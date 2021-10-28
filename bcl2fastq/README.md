# Install

## Prep

Visit Illumina's web site and download the zip/tar: https://support.illumina.com/downloads/bcl2fastq-conversion-software-v2-20.html

Move to source directory and place downloaded zip/tar:

```bash
mv $SOMEWHERE/bcl2fastq2-v2-20-0-tar.zip $PREFIX/src/bcl2fastq/

cd $PREFIX/src/bcl2fastq/

untar bcl2fastq2-v2-20-0-tar.zip

tar -xf bcl2fastq2-v2.20.0.422-Source.tar.gz

mkdir bcl2fastq/bcl2fastq-build

cd bcl2fastq/bcl2fastq-build
```

## Configure

```bash
../src/configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/bcl2fastq/2.20.0 
```

## Build

```bash
make
```

## Install

```bash
make install
```
