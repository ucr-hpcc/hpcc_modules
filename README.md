# HPCC Modules

These are the modules that are currently available on the UCR HPC cluster.

## Install Software

The most common forms of installs are either binary or source.
We do support all kinds of packaged software, thus installations can become more complex then what is covered here.
For specific installation details please refer to the documentation prodvided by the software as well as the individual `README.md` files contained within the installed module, assuming that the softwere had been insatlled previously.

### Binary

When installing a binary all that is requied is to download and then extract.
Sometimes there may be an `install` script to place the binaries under their final resting place, or you may have to do this manually.

### Source

#### Configure

When installing from a `configure` based install, the following would typically apply:

```bash
configure
make
make install
```

#### CMake

When installing from a `cmake` based instaall, the following would typically apply:

```bash
mkdir build
cd build
cmake ../
```

## Documentation

When installing software you must create a `README.md` file within the software module directory with reproducible instructions.
Creating a `hpcc_install.sh` script within the source tree can also be very useful for later installs.

Here is a documentation example: [openbabel/README.md](openbabel)

Here is another example (conda): [qiime2/README.md](qiime2)

Here is yet one more example (singularity): [freefem/README.md](freefem)

## Create Module

__Standards__

1. Keep names of packages to all lowercase when possible.
2. Spaces are not allowed, underscores should be used in place of spaces for software module names.
3. Symlinks can be used to reduce duplicate installs (ie. `conda`/`singularity`).
4. When software requires a common write location or unique config file, use environment variables within the module to define these.

__Environment variables__

The following variables are used and should be set automatically:

  * `HPCC_MODULES` - Path dynamically built by /etc/profile.d/hpcc_modules.sh based on OS and arch.
  * `MODULESHOME` - Path set by module system to specify home of module system.
  * `MODULEPATH` - List set by module system to indicate where modules live (colon delimited).

__Basic Process__

First set some variables:

```bash
# Software name
SOFT_NAME=[software name]

# First character of software name
SOFT_FIRST=${SOFT_NAME:0:1}

# Software version
SOFT_VER=[software version]
```

1. Make sure you have a checkout of the hpcc_modules repository
2. Login as `pkgadmin`
3. Create and move into the `$HPCC_MODULES/../src/$SOFT_FIRST/$SOFT_NAME` directory
4. Download and extract the source files
5. Create a directory named `$HPCC_MODULES/$SOFT_NAME/$SOFT_VER`
6. Move binaries (precompiled) or install software into the directory created in step 5
7. Log out of `pkgadmin`
8. Move to your local `hpcc_modules` repo checkout
9. Copy any one of the existing directories, an rename it to `$SOFT_NAME`
10. Go into the newly created `$SOFT_NAME` directory
11. By default the latest version will be loaded, if this is not wanted then add the `.version` file
12. Rename one of the contained files to `$SOFT_VER`
13. Edit the file from step 12 so that it contains the correct module name, version and paths
14. `git add [soft version]` as well as `.version` if added, then `git commit` the changes, lastly do `git push`
15. After this you can test the installation by trying `module load $SOFT_NAME` and `module avail $SOFT_NAME`

