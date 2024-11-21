# Version 3

Built using Docker on personal machine, then generated .sif file and uploaded to cluster.
Used steps from here:
https://github.com/google-deepmind/alphafold3/blob/main/docs/installation.md#running-using-singularity-instead-of-docker

# Version 2

Built singularity image on ubuntu system
with directions from here 
https://www.rbvi.ucsf.edu/chimerax/data/singularity-apr2022/afsingularity.html

using 2.3.0 release https://github.com/deepmind/alphafold/archive/refs/tags/v2.3.0.tar.gz

had to install docker on the system, then GO, then build singularity.
Did need to have installed the GO seccomp library
https://docs.sylabs.io/guides/3.0/user-guide/quick_start.html
```
export VERSION=1.19.5 OS=linux ARCH=amd64
cd /tmp
wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
mkdir -p $GOPATH/src/github.com/sylabs
cd $GOPATH/src/github.com/sylabs
git clone https://github.com/sylabs/singularity.git
cd singularity
go get -u -v github.com/golang/dep/cmd/dep
go get github.com/seccomp/libseccomp-golang
./mconfig
make -C builddir
sudo make -C builddir install
```

Then follow directions on docker build and then singularity conversion
https://www.rbvi.ucsf.edu/chimerax/data/singularity-apr2022/afsingularity.html
