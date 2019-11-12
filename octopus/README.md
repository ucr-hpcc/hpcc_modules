# Install

## Download
Get and unpack the source code:

```bash
wget http://octopus-code.org/down.php?file=9.1/octopus-9.1.tar.gz
tar -xf octopus-9.1.tar.gz
cd octopus-9.1
```

## Compile
Make sure fftw3-devel and fftw3-libs are installed via yum.
Then compile with the following lines:

```bash
module load slurm/19.05.0
module load openmpi/4.0.1-slurm-19.05.0
module load gsl/2.5
module load libxc/4.2.3

export LIBS_FFT="-L/usr/lib64 -lfftw3f"
export CPPFLAGS="-I/usr/include"

./configure \
--prefix=/opt/linux/centos/7.x/x86_64/pkgs/octopus/9.1 \
--with-libxc-prefix=/opt/linux/centos/7.x/x86_64/pkgs/libxc/4.2.3 \
--with-gsl-prefix=/opt/linux/centos/7.x/x86_64/pkgs/gsl/2.5 \
--enable-openmp \
--enable-mpi || exit 1

make && make install
```
