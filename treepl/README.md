# Submit job

In order to compile, you will need to request an interactive job:

```bash
srun -p short -C intel -c 4 --mem=10g --pty bash -l
```

### Unload unwanted software and load others
`module unload miniconda2 miniconda3 anaconda2 anaconda3
module load extra GCC/8.0.3`

# Download source code
`git clone git://github.com/blackrim/treePL.git`

# Move into source code dependencies (`deps`) subdirectory
`cd treePL/deps/`
# Dependencies
## nlopt dependency
### Extract nlopt
`tar -xf nlopt-2.4.2.tar.gz`

### Make directory where nlopt will be installed
`mkdir -p /bigdata/GROUP/USERNAME/software/nlopt/2.4.2`


### Configure nlopt
`./configure --prefix=/bigdata/GROUP/USERNAME/software/nlopt/2.4.2`

### Build and install nlopt
`make && make install`

### Move up to dependencies (`deps`) directory
`cd ..`

## ADOL-C dependency
### Extract adol-c
`tar -xf adol-c_git_saved.tar.gz`

### Move into adol-c source directory
`cd adol-c`
### Update source code
`./update_versions.sh`

### Create directory where adol-c will be installed
`mkdir -p /bigdata/GROUP/USERNAME/software/adol-c/git`

### Configure adol-c
`./configure --prefix=/bigdata/GROUP/USERNAME/software/adol-c/git`

### Build and install adol-c
`make && make install`

### Move up and over to main treePL source code directory
`cd ../../src`

# Edit your Makefile
### 1.) Manually edit the Makefile.in file, line 13 should look like the line bellow (be sure to use your own paths):
`LIBS := -lm $(OPENMP) -ladolc -lnlopt
-L/usr/lib64:/usr/local/lib64:/bigdata/GROUP/USERNAME/software/adol-c/git/lib64:/bigdata/GROUP/USERNAME/software/nlopt/2.4.2/lib`

### 2.) Manually edit the Makefile.in file, line 14 should look like the line below (be sure to use your own paths):
`LDFLAGS := -L/usr/local/lib64 -I/usr/local/include -L/bigdata/GROUP/USERNAME/software/adol-c/git/lib64/ -L/bigdata/GROUP/USERNAME/software/nlopt/2.4.2/lib -I/bigdata/GROUP/USERNAME/software/nlopt/2.4.2/include -I/bigdata/GROUP/USERNAME/software/adol-c/git/include`

### 3.) Manually edit Makefile.in file, line 20 should look like the line below (be sure to use your own path):
`prefix = /bigdata/GROUP/USERNAME/software/treepl/1.0`

# COMPILATION
### Then compile from the src directory with the following command:
`CPPFLAGS='-L/bigdata/GROUP/USERNAME/software/adol-c/git/lib64/
-L/bigdata/GROUP/USERNAME/software/nlopt/2.4.2/lib-I/bigdata/GROUP/USERNAME/software/nlopt/2.4.2/include-I/bigdata/GROUP/USERNAME/software/adol-c/git/include'
./configure--prefix=/bigdata/GROUP/USERNAME/software/treepl/1.0`

### final steps
`make && make install`
