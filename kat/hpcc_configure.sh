#!/bin/bash

# NOTE: Copy to source directory and run. Modify if needed.

KAT_VERSION=2.3.4
INSTALL_DIR=/opt/linux/centos/7.x/x86_64/pkgs/kat/${KAT_VERSION}/

# KAT requires scipy, numpy, sphinx, and matplotlib under Python 3
module unload python
module load python/3.6.0

./configure --prefix=$INSTALL_DIR
make -j 8
make check -j 8
make install

# scripts directory not installed by make install for some reason.
cp -pvr scripts $INSTALL_DIR
