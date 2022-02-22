# FreeFEM

## Definition File

Create a `Singularity.def` file. In order to do this copy an existing one or follow the basic outline described [here](https://sylabs.io/guides/3.9/user-guide/definition_files.html).

## Build Container

Once a `Singularity.def` definition file exists, you can build the container:

```bash
sudo bash -l "module load singularity; cd $PWD; singularity build freefem.simg Singularity.def"
```

> Note: You must be able to exectue singularity are root.

## Install

Manually create install directories:

```bash
mkdir -p $HPCC_MODULES/freefem/4.10/{bin,images}
```

Copy `freefem.simg` image to install directory `$HPCC_MODULES/freefem/4.10/images/`. If built locally then a simple `cp`/`mv` command could suffice.
If the image was built remotely, then use `rsync` to copy container image to install directory.

Since a `%runscript` directive was used, then create appropriate symlink in `bin` install directory:

```bash
cd $HPCC_MODULES/freefem/4.10/bin
ln -s ../images/freefem.simg FreeFem++
```

