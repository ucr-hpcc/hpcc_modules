## Installed `autodockfr` [ [URL](https://ccsb.scripps.edu/adfr/) ]  

## Download

Download and stage source:

```bash
cd $HPCC_MODULES/../src
mkdir -p a/autodockfr && cd a/autodockfr
wget https://ccsb.scripps.edu/adfr/download/1038/
tar -zxvf ADFRsuite_x86_64Linux_1.0.tar.gz
cd ADFRsuite_x86_64Linux_1.0
```

## Install

```sh
./install.sh -d $HPCC_MODULES/autodockfr/1.0/
```



