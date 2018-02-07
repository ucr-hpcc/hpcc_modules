# Silix notes

### Build Configuration

Silix can optionally take advantage of MPI and Boost:

```bash
INSTALL_DIR=/opt/linux/centos/7.x/x86_64/pkgs/silix/1.2.9-mpich

mkdir -p $INSTALL_DIR

module unload openmpi

module load mpich
module load boost/1.64.0

./configure --enable-mpi --enable-hash --prefix=$INSTALL_DIR
make
make check
make install
```
