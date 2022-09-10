# EnTAP

## Download

Download the entap database

```bash
cd ls /srv/projects/db
mkdir -p enTAP/10.8 && cd enTAP/10.8
wget https://treegenesdb.org/FTP/EnTAP/latest/databases/entap_database.bin.gz
gzip -dk entap_database.bin.gz
```

Download and stage source:

```bash
cd $HPCC_MODULES/../src
mkdir -p e/entap && cd e/entap
wget https://gitlab.com/enTAP/EnTAP/-/archive/v0.10.8-beta/EnTAP-v0.10.8-beta.tar.gz
tar -zxvf EnTAP-v0.10.8-beta.tar.gz
cd EnTAP-v0.10.8-beta
```

## Prepare Env

Ensure build dir is clean

```bash
rm -rf build
mkdir build
cd build
```

Run `cmake` to generate make files:

```bash
cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/opt/linux/rocky/8.x/x86_64/pkgs/entap/0.10.8-beta/
```

## Build and Install

Then run make and install:

```bash
make install
```

## Change the entap config file

Modify `entap_config.ini`
Include the path for each of the programs in this file
