# EasyBuild

## Config

Since the install step relies a bit on these paths (paths, prefixes, subdirs, etc...), it is best to make sure all options are defined before installation.
If you have an older `config.cfg` file then you may want to port over your options in the new format, otherwise just use the new template:


``` bash
# Default config location
EBCONFIG=${HOME}/.config/easybuild/config.cfg

# Check if old config exists and rename it
if [[ -f ${EBCONFIG} ]]; then
    mv ${EBCONFIG} ${EBCONFIG}_old
fi

# Create new config template
eb --confighelp > ${EBCONFIG}

# Open new template and port old options
vim ${EBCONFIG}
```


## Install

Installing EasyBuild via the bootstrap is the easiest method:

```bash
# Purge everything
module purge

# Set install prefix
EASYBUILD_PREFIX=/opt/linux/centos/7.x/x86_64/easybuild

# Download bootstrap script
curl -O https://raw.githubusercontent.com/hpcugent/easybuild-framework/develop/easybuild/scripts/bootstrap_eb.py

# Run install via script
python bootstrap_eb.py $EASYBUILD_PREFIX

# We have EasyBuild modules under extra
module load extra
module load EasyBuild
```

## Eaxmples

### Typical Install

Basic method of installing via EasyBuild

```bash
# Load EasyBuild
module load EasyBuild

# Find available install options
eb --list-software | egrep '^\*' | grep -i cmake

# Maybe this is simpler?
#eb -S ^CMake

# Install CMake using existing GCC module and filter dependencies
eb --software-name=CMake --toolchain=GCC,4.9.3-2.25 --minimal-toolchains --filter-deps=ncurses

# Show installed module
module avail CMake
```

### Empty Suffix

Force empty suffix:

```
eb --software-name=GCC --software-version=4.8.1 --amend versionsuffix=''
```

### Defining suffix

Define a specifc suffix:

```
eb --software-name=icc --software-version=2016.2.181 --amend versionsuffix='-GCC-4.9.3-2.25'
```

## Info

http://easybuild.readthedocs.io/en/latest/version-specific/Supported_software.html
http://easybuild.readthedocs.io/en/latest/Using_the_EasyBuild_command_line.html
