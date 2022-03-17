# Phred/Phrap/Consed

## Get Source

Visit their site and aquire software:
   http://www.phrap.org/consed/consed.html#howToGet

## Build

Extract source into new directory and build:

```bash
SOFT_NAME='phred-phrap-consed'
SOFT_VER='0.990329'

mkdir -p $HPCC_MODULES/../src/p/$SOFT_NAME/$SOFT_VER

# Upload source files to this directory
cd $HPCC_MODULES/../src/p/$SOFT_NAME/

# Extract phrap and cross_match
tar -C $SOFT_VER -xf phrap.cross_match.swat.tar.gz
```

Build phrap and cross_match:

```bash
cd $SOFT_VER
make manyreads
```

Organize (we only need binaries):

```
rm -f *.o
rm -f *.h
rm -f *.c
mkdir doc
mkdir lib
mkdir data
ln -s . bin
```

Extract consed:

```bash
cd $HPCC_MODULES/../src/p/$SOFT_NAME
tar -C $SOFT_VER -xf consed_linux.tar.gz
```

Extract phred:

```bash
cd $HPCC_MODULES/../src/p/$SOFT_NAME
tar -C $SOFT_VER -xf consed_linux.tar.gz
```

Final clean up:

```bash
mv *.doc $SOFT_VER/doc/
mv mat* $SOFT_VER/data/
# Download really old lib (CentOS 7 RPM - compat-libstdc++-33)
mv /some/path/libstdc++.so.5.0.7 lib/
cd lib/ && ln -s libstdc++.so.5.0.7 libstdc++.so.5
```

## Install

Move build dir to install dir:

```bash
mkdir -p $HPCC_MODULES/$SOFT_NAME/$SOFT_VER
mv $HPCC_MODULES/../src/p/$SOFT_NAME/$SOFT_VER $HPCC_MODULES/$SOFT_NAME/$SOFT_VER
```

