# ELSI

ELSI can be downloaded from their website

```
https://wordpress.elsi-interchange.org/index.php/download/
```

## Installation

Copy the `hpcc_install.sh` script from the previous version to the new one.

Some config options need to be changed. They /should/ be automatically done in the `hpcc_install.sh` script. If not, the following need to be updated:

```
cd toolchains/
vim gnu.cmake
```

 - `LIB_PATHS` needs to be set to `/opt/linux/rocky/8.x/x86_64/pkgs/scalapack/2.2.0/lib`
 - `LIBS` needs to be set to `libscalapack.a;liblapack.a;libopenblas.a`

```
cd ..  # Back in `elsi_interface` folder
./hpcc_install.sh
```
