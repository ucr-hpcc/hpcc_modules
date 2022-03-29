# GadgetViewer

## Prep

Admin must install gtk2, gtk3 was not compatible:

```bash
sudo dnf install gtk2 gtk2-devel
```

## Download

Get source code:

```bash
cd $SRCDIR
wget https://github.com/jchelly/gadgetviewer/releases/download/1.1.2/gadgetviewer-1.1.2.tar.gz
tar -xf gadgetviewer-1.1.2.tar.gz
cd gadgetviewer-1.1.2
```

## Configure

```bash
# Load modules
module load hdf5/1.12.1

# Configure software
./configure --prefix=$HPCC_MODULES/gadgetviewer/1.1.2 --with-hdf5=$HPCC_MODULES/hdf5/1.12.1
make
```

## Build

Compile and install software:

```bash
make && make install
```

