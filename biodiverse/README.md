# Biodiverse Notes

Reference: https://github.com/shawnlaffan/biodiverse/wiki/InstallationLinuxSource

## Install development headers

Most of the *-devel packages are available either in the main or EPEL repositories.
Those that aren't (e.g. epsilon and libkml) need to be installed as modules.

## Setup Biodiverse in Perlbrew environment

Note 1: Biodiverse has both a Git component and a CPAN component. This creates a
versioning nightmare. I'm settling on combining the Git commit number with the
commit hash. This creates a "version number" that always increases (unlike the
hash by itself).

Note 2: I'm assuming you're running these steps sequentially in the same
session. Module unloads and variable names from previous steps may apply to
later steps.

Note 3: `~/.perlbrew/init` may have some stale defaults. It may be necessary to
delete that file if sourcing `etc/bashrc` fails. Also see the note about
`perlbrew switch` below.

### Initial Perlbrew setup

```bash
module unload perl

cd /opt/linux/centos/7.x/x86_64/src/biodiverse-git/
git pull # Skip if updating Biodiverse is not desired

REV_COUNT=$(git rev-list --count master)
REV_HASH=$(grep "'master'" .git/FETCH_HEAD | cut -b 1-7)
BIODIVERSE_VERSION=r${REV_COUNT}_${REV_HASH}

export PERLBREW_ROOT=/opt/linux/centos/7.x/x86_64/pkgs/biodiverse/$BIODIVERSE_VERSION
mkdir -p $PERLBREW_ROOT
cd $PERLBREW_ROOT

# Piping curl into Bash didn't work for me. I think a new Bash login shell
# started, with Perl loaded and sh!t. So...
# Note: PERLBREW_ROOT is important for perlbrew-install.sh

curl -L https://install.perlbrew.pl > perlbrew-install.sh
chmod +x perlbrew-install.sh
./perlbrew-install.sh
```

### Install latest version of Perl

Because CentOS 7's ancient Perl version makes Panda a sad panda...

Note: Avoid using `perlbrew switch`. This writes to `~/.perlbrew/init`, which
can screw with setting up additional Perlbrew environments later on.
Unfortunately, avoiding `switch` means an extra `perlbrew use` command to
completely load the environment each time.

```bash
source $PERLBREW_ROOT/etc/bashrc

perlbrew available # Check for latest Perl version, fill in 5.xx.y below
perlbrew install perl-5.xx.y
perlbrew use perl-5.xx.y

perlbrew install-cpanm
```

### Install Perl component of Biodiverse

The `cpanm` help says `--interactive` is required for `Task::*` packages.

```bash
module load epsilon/0.9.2
module load libkml/8609edf
module load gdal/2.1.3

cpanm Glib
cpanm --interactive Task::Biodiverse::NoGUI

cpanm Gtk2
cpanm --interactive Task::Biodiverse

cpanm Panda::Lib
cpanm http://www.biodiverse.unsw.edu.au/downloads/Biodiverse-Utils-1.06.tar.gz

export PERL_GDAL_CONFIG=/opt/linux/centos/7.x/x86_64/pkgs/gdal/2.1.3/bin/gdal-config
export PERL_GDAL_NO_VERSION_CHECK=1
cpanm Geo::GDAL
```

### Install Git component of Biodiverse

```bash
mkdir $PERLBREW_ROOT/biodiverse

cd /opt/linux/centos/7.x/x86_64/src/biodiverse-git/
cp -pvr -t $PERLBREW_ROOT/biodiverse *

cd $PERLBREW_ROOT/biodiverse/bin
vim BiodiverseGUI.pl # Modify shebang line to "#!/usr/bin/env perl"
```

### Launching Biodiverse

```bash
$PERLBREW_ROOT/biodiverse/bin/BiodiverseGUI.pl
```

## Modifying the Perlbrew environment after installation

The biodiverse module file only contains the bare minimum PATHs and MANPATHs
necessary to support biodiverse. To modify the Perlbrew environment, load it
the perlbrew way:

```bash
# Replace version numbers as necessary
module unload perl
module load epsilon/0.9.2
module load libkml/8609edf
module load gdal/2.1.3
source /opt/linux/centos/7.x/x86_64/pkgs/biodiverse/r2742_424d9c2/etc/bashrc
perlbrew use perl-5.26.2
```
