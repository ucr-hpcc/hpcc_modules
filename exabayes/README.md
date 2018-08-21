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

### MPI enabled example

```
mkdir ~./bigdata/exabayes-test
cd ~./bigdata/exabayes-test
cp /opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi/share/doc/exabayes/examples/dna-partitioned/aln.p* .
cp /opt/linux/centos/7.x/x86_64/pkgs/exabayes/1.5-mpi/share/doc/exabayes/examples/configFile-all-options.nex ./config.nex
```

You have to modify config.nex (remove the square brackets to uncomment). Uncomment numGens and set it to 100000 (or 1e5). Uncomment numRuns and set it to 4. This means that ExaBayes will conduct 4 independent analysis (starting in 4 different random trees). If all runs yield the same split frequencies (i.e., the same confidence in a split), we can be relatively sure that we have sampled the topology parameter sufficiently (while it is still possible that simply all 4 chains got stuck in the same local optimum).

Check out the partitions file (aln.part): it contains 4 partitions. By default, ExaBayes assumes that partitions have distinct branch lengths. Let's link all partitions into a single branch length parameter. To do so, add "brlens = (0-3)" in the params section.

```
srun -p short,intel --ntasks 16 --nodes 4 --pty bash -l
cd ~./bigdata/exabayes-test
module load exabayes
mpirun -np 16 exabayes -f aln.phy -q aln.part -n myRun -s $RANDOM -c config.nex -R 4
```
After ≈ 150,000 generations, the ASDSF should have fallen below 5%, which is acceptable. A look at the consensus tree reveals that this dataset in fact contains several low confidence branches. While in the first run the reason for low confidence branches was due to the low number of generations, we can be more certain now that that low confidence branches are a result of the phylogenetic signal in the alignment. Since you ran 2 independent analyses, you obtain 2 sets of output files (parameter and topologies). You can feed both files into the consensus tree (for both files the initial 25% of samples will be discarded).

```
consense -f ExaBayes_topologies.myRun.* -n myCons
```

Analyze both parameter files using

```
postProcParam -f ExaBayes_parameters.myRun.* -n params
```

Since we carried out two partitioned analyses, we have a larger number of parameters (where e.g., r{2}(C<->T) is the substitution probability of C to T in the third partition). We find that nearly all parameters have an ESS >100. The final column now contains the potential scale reduction factor (PSRF). It indicates, whether within-chain variance (of a parameter) is similar to between-chain variance. For this convergence statistic, values should be close to 1, but lower than 1.2 or 1.1 (probably the case after 150,000 generations).

So far, we have neglected the branch length parameter. You may already have noticed, that the consensus tree has been annotated with branch lengths. To extract ESS and PSRF values for each branch length, run:

```
extractBips -f ExaBayes_topologies.myRun.* -n bls
```

Thus, you obtain the following files:

ExaBayes_bipartitions.tmp 
* contains an identifier for each branch/split (that is explicitly printed)

ExaBayes_fileNames.tmp 
* lists the file names used as input (and assigned an id to them)

ExaBayes_bipartitionBranchLengths.tmp 
* contains all raw branch lengths sampled and lists split id and file ids

ExaBayes_bipartitionStatistics.tmp 
* contains statistics for each branch (specifically the ESS and PSRF)
