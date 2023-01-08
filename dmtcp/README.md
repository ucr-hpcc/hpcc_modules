## dmtcp

### Install

Find the latest version (2.6.0 at the time of writing) from https://github.com/dmtcp/dmtcp/releases or https://dmtcp.sourceforge.io/downloads.html

```bash
cd $HPCC_MODULES/../src/d/dmtcp/
wget https://github.com/dmtcp/dmtcp/releases/download/2.6.0/dmtcp-2.6.0.tar.gz
tar -xvf dmtcp-2.6.0.tar.gz
cd dmtcp-2.6.0
```

Copy, modify, and run the `hpcc_install.sh` script from previous version

```bash
cp $HPCC_MODULES/../src/d/dmtcp/dmtcp-2.6.0/hpcc_install.sh .
vim hpcc_install.sh # Update version number
./hpcc_install.sh
```

Create a module file as you would for any other module.
