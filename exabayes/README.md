# Exabayes installation notes

## Download Exabayes and extract

```
mkdir /opt/linux/centos/7.x/x86_64/src/exabayes
cd /opt/linux/centos/7.x/x86_64/src/exabayes
wget https://sco.h-its.org/exelixis/resource/download/software/exabayes-1.5.tar.gz
tar -zxvf exabayes-1.5.tar.gz
```

## Configure, Make, Make Install

```
mkdir -p /opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi
cd /opt/linux/centos/7.x/x86_64/src/exabayes/exabayes-1.5

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi --enable-mpi
make
make install
```

## Testing/Example

For this example you can make a directory, copy example data in, and run it.

```
mkdir ~./bigdata/exabayes-test
cd ~./bigdata/exabayes-test
cp /opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi/share/doc/exabayes/examples/dna-partitioned/aln.p* .
cp /opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi/share/doc/exabayes/examples/configFile-all-options.nex ./config.nex

module load exabayes
yggdrasil -f aln.phy -m DNA -n myRun -s $RANDOM

# Stop the run after something like 50,000 generations (using Control-c).

# Now use the post-processing tools to examine the result. First, we create a consensus tree:

consense -f ExaBayes_topologies.run-0.myRun -n myCons

# Let's inspect the 50% credible set of trees:

credibleSet -f ExaBayes_topologies.run-0.myRun -n cred

# Finally, let's check, how well the parameters are sampled

postProcParam -f ExaBayes_parameters.run-0.myRun -n params
```
