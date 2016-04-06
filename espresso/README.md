
# Install
download and untar

# Compile
Had to specify default paths of libs so that intel mkl was overwritten
    ```
    ./configure --enable-openmp --prefix=/opt/linux/centos/7.x/x86_64/pkgs/espresso/5.3.0 BLAS_LIBS="-L/usr/lib64 -lblas" LAPACK_LIBS="-L/usr/lib64 -llapack" FFT_LIBS="-L/usr/lib64 -lfftw" && \
    make -j 4 all && \
    make install
    ```
