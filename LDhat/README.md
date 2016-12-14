# Install
Checkout from https://github.com/auton1/LDhat
```
git clone https://github.com/auton1/LDhat.git
```
Compile
```
cd LDhat
make
```
Install
```
mkdir -p ../../pkgs/LDhat/2.2a/bin
rsync -a convert pairwise interval lkgen complete stat fin rhomap ../../pkgs/LDhat/2.2a/bin/
mkdir -p ../../pkgs/LDhat/2.2a/share/doc
rsync -a README.md Example ../../pkgs/LDhat/2.2a/share/doc
rsync -a manual_source  ../../pkgs/LDhat/2.2a/share/doc/
# LK files are for speeding up lkgen tool - see the LDhat readme or manual
rsync -a lk_files ../../pkgs/LDhat/2.2a/share/
gunzip ../../pkgs/LDhat/2.2a/share/lk_files/*.gz
```
