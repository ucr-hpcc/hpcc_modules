# trinity-rnaseq Notes

* Unpack tar into install location.
* load modules
  * module load cmake/3.12.3
  * module unload perl
  * module load perl/5.24.0
  * module load bowtie2/2.3.4.1
  * module load jellyfish/2.2.9
  * module load salmon/0.9.1
* Set TRINITY_HOME
  * export TRINITY_HOME=$PWD
* Run make
  * make
* Create module file

## Singularity

First download the source code.

Then run build script as (root is not required):

```bash
# Interactive job
srun -p short -c 2 --mem=8gb --pty bash -l

# Run build script
trinityrnaseq/trinityrnaseq.git/Docker/make_simg.sh
```

This will create an image `trinityrnaseq.v${VERSION}.simg`.

Create install directory and copy singularity image to it:

```
mkdir -p ${HPCC_MODULES}/trinity-rnaseq/${VERSION}/images
cp trinityrnaseq.v${VERSION}.simg ${HPCC_MODULES}/trinity-rnaseq/${VERSION}/images/trinityrnaseq.simg
```

Copy custom wrapper to install directory:

```
cp ${HPCC_MODULES}/trinity-rnaseq/${OLD_VERSION}/Trinity ${HPCC_MODULES}/trinity-rnaseq/${VERSION}/Trinity
```

Create symlinks for utils:

```
find ${TRINITY_SOURCE}/util/ -maxdepth 1 -name '*.pl' -exec ln -s {} . \;
```
