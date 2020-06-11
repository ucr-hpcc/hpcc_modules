# RAxML-NG v0.9.0



## Install

Get the RAxML-NG Linux MPI version of the source code, since it has a prebuilt `libpll`.

```bash
mkdir raxml-ng-0.9.0
cd raxml-ng-0.9.0
mkdir build && cd build

module load cmake/3.4.0
module load extra GCC/7.4.0-2.31.1

export CC=$(which gcc)
export CXX=$(which g++)

# Build it twice so we have an MPI and non MPI version
cmake -DUSE_MPI=ON ..
cmake -DUSE_MPI=OFF ..
make
```

### From Raxml Readme
PTHREADS version:

```
git clone --recursive https://github.com/amkozlov/raxml-ng
cd raxml-ng
mkdir build && cd build
cmake ..
make
```

MPI version (This did not work for me, missing `libpll`):

```
git clone --recursive https://github.com/amkozlov/raxml-ng
cd raxml-ng
mkdir build && cd build
cmake -DUSE_MPI=ON ..
make
```

Portable PTHREADS version (static linkage, compatible with old non-AVX CPUs):

```
git clone --recursive https://github.com/amkozlov/raxml-ng
cd raxml-ng
mkdir build && cd build
cmake -DSTATIC_BUILD=ON -DENABLE_RAXML_SIMD=OFF -DENABLE_PLLMOD_SIMD=OFF ..
make
```

## Usage examples

  1. Perform single tree inference on DNA alignment
     (random starting tree, general time-reversible model, ML estimate of substitution rates and
      nucleotide frequencies, discrete GAMMA model of rate heterogeneity with 4 categories):

     `./raxml-ng --msa testDNA.fa --model GTR+G`

  2. Perform an all-in-one analysis (ML tree search + non-parametric bootstrap)
     (10 randomized parsimony starting trees, fixed empirical substitution matrix (LG),
      empirical aminoacid frequencies from alignment, 8 discrete GAMMA categories,
      200 bootstrap replicates):

     `./raxml-ng --all --msa testAA.fa --model LG+G8+F --tree pars{10} --bs-trees 200`


  3. Optimize branch lengths and free model parameters on a fixed topology
     (using multiple partitions with proportional branch lengths)

     `./raxml-ng --evaluate --msa testAA.fa --model partitions.txt --tree test.tree --brlen scaled`

  4. Map support values from existing set of replicate trees:

     `./raxml-ng --support --tree bestML.tree --bs-trees bootstraps.tree`


