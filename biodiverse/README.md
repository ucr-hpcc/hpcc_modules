# Biodiverse Notes

Reference: https://github.com/shawnlaffan/biodiverse/wiki/InstallationLinuxSource

## Install development headers

Most of the *-devel packages are available either in the main or EPEL repositories.
Those that aren't (e.g. epsilon and libkml) need to be installed as modules.

## Install perlbrew

```bash
module unload perl

curl -L https://install.perlbrew.pl > perlbrew-install.sh

export PERLBREW_ROOT=/opt/linux/centos/7.x/x86_64/pkgs/biodiverse/2.000
mkdir -p $PERLBREW_ROOT
chmod +x perlbrew-install.sh
./perlbrew-install.sh
```

## Install latest version of Perl

Because CentOS 7's ancient Perl version makes Panda a sad panda...

```bash
perlbrew available
perlbrew install perl-5.xx.y
perlbrew switch perl-5.xx.y
```

## Install biodiverse

```bash
source /opt/linux/centos/7.x/x86_64/pkgs/biodiverse/2.000/etc/bashrc

module load epsilon
module load libkml

perlbrew install-cpanm

export PERL_CPANM_OPT="-l $PERLBREW_ROOT"

# The Glib Perl module provided by CentOS doesnt seem to have MakeHelper.pm ...
cpanm Glib
cpanm Task::Biodiverse::NoGUI

# cpanm didn't get the package ordering right for Gnome2::Canvas
cpanm Gtk2
cpanm Task::Biodiverse

cpanm IO::Socket::SSL
cpanm Panda::Lib
cpanm http://www.biodiverse.unsw.edu.au/downloads/Biodiverse-Utils-1.06.tar.gz
```
