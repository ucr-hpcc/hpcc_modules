# Install treePL

## Prepare
In order to compile, you will need to request an interactive job:

```bash
srun -p short -C intel -c 4 --mem=10g --pty bash -l
```

Once a node has been allocated, unload unwanted software and load others:

```bash
module unload miniconda2 miniconda3 anaconda2 anaconda3
module unload perl
module load extra GCC/8.3.0
```

Next, download the treePL source code:

```bash
mkdir ~/src
cd ~/src
git clone git://github.com/blackrim/treePL.git
```

### Dependencies

Move into source code dependencies (`deps`) subdirectory:

```bash
cd ~/src/treePL/deps/
```

#### nlopt

Extract nlopt:

```bash
tar -xf nlopt-2.4.2.tar.gz
```

Make directory where nlopt will be installed:

```bash
mkdir -p /bigdata/$GROUP/$USER/software/nlopt/2.4.2
```

Configure nlopt:

```bash
./configure --prefix=/bigdata/$GROUP/$USER/software/nlopt/2.4.2
```

Build and install nlopt:

```bash
make && make install
```

#### adol-c

```bash
cd ~/src/treePL/deps/
```

Extract adol-c:

```bash
tar -xf adol-c_git_saved.tar.gz
```

Move into adol-c source directory:

```bash
cd adol-c
```

Update source code:

```bash
./update_versions.sh
```

Create directory where adol-c will be installed:

```bash
mkdir -p /bigdata/$GROUP/$USER/software/adol-c/git
```

Configure adol-c

```bash
./configure --prefix=/bigdata/$GROUP/$USER/software/adol-c/git
```

Build and install adol-c

```bash
make && make install
```

## Build

### Makefile

For this section, since we are modifying a file and not running a command on the command line, you will need to replace all occurrences of `$GROUP` and `$USER` with your actual group and username. These values can be determined like so:

```bash
echo $USER
echo $GROUP
```

Manually edit the `~/src/treePL/src/Makefile.in` file, line 13 should look like the line bellow (be sure to use your own paths):

```
LIBS := -lm $(OPENMP) -ladolc -lnlopt -L/usr/lib64:/usr/local/lib64:/bigdata/$GROUP/$USER/software/adol-c/git/lib64:/bigdata/$GROUP/$USER/software/nlopt/2.4.2/lib
```

Manually edit the `Makefile.in` file once more file, line 14 should look like the line below (be sure to use your own paths):

```
LDFLAGS := -L/usr/local/lib64 -I/usr/local/include -L/bigdata/$GROUP/$USER/software/adol-c/git/lib64/ -L/bigdata/$GROUP/$USER/software/nlopt/2.4.2/lib -I/bigdata/$GROUP/$USER/software/nlopt/2.4.2/include -I/bigdata/$GROUP/$USER/software/adol-c/git/include
```

Manually edit the `Makefile.in` file one last time, line 20 should look like the line below (be sure to use your own path):

```
prefix = /bigdata/$GROUP/$USER/software/treepl/1.0
```

### Configure

Then run configure from the `~/src/treePL/src` directory with the following command:

```
CPPFLAGS='-L/bigdata/$GROUP/$USER/software/adol-c/git/lib64/
-L/bigdata/$GROUP/$USER/software/nlopt/2.4.2/lib-I/bigdata/$GROUP/$USER/software/nlopt/2.4.2/include-I/bigdata/$GROUP/$USER/software/adol-c/git/include'
./configure--prefix=/bigdata/$GROUP/$USER/software/treepl/1.0
```

### Compile

The last step we need to do is to compile (build) the binaries and libraries:

```bash
make && make install
```
