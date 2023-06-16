#!/bin/bash -l

####################################
# Simple compilation script for R  #
####################################

SOFT_NAME='R'
SOFT_VER='4.3.0'

# Unload everything
module purge

# Need java
module load java

./configure \
--prefix $HPCC_MODULES/$SOFT_NAME/$SOFT_VER \
--enable-R-shlib \
--enable-BLAS-shlib \
--enable-shared \
--enable-static \
--with-blas \
--with-lapack \
--with-libpng \
--with-jpeglib \
--with-cairo \
--with-x \

if [[ $? -eq 0 ]];then
  make
fi

if [[ $? -eq 0 ]];then
  make install
fi
