# TEclass installation notes

## Download TEclass and extract

```
cd /opt/linux/centos/7.x/x86_64/src/
wget 'http://www.bioinformatics.uni-muenster.de/tools/teclass/download/TEclass-2.1.3.tar.gz'

mkdir /opt/linux/centos/7.x/x86_64/pkgs/teclass/
cd /opt/linux/centos/7.x/x86_64/pkgs/teclass/
tar -xf /opt/linux/centos/7.x/x86_64/src/TEclass-2.1.3.tar.gz
mv TEclass-2.1.3 2.1.3
```

## Run the download and compilation scripts

```
cd /opt/linux/centos/7.x/x86_64/pkgs/teclass/2.1.3/
./Download_dependencies.sh
```

Some of the links may be broken, so you'll need to download some manually:

```
curl -o 'blast.tar.gz' 'ftp://ftp.ncbi.nlm.nih.gov/blast/executables/legacy.NOTSUPPORTED/2.2.26/blast-2.2.26-x64-linux.tar.gz'
curl -o 'librf.tar.gz' 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/librf/librf.0.1.tar.gz'
```

Compilation should run without issue:

```
./Compile_dependencies.sh
```

## Run the configure script

```
# For newer versions of RepeatMaskerLib with the filename "RMRBSeqs.embl",
# create a symlink to the for name RepeatMaskerLib.embl:
# (cd /srv/projects/db/repbase/20170127/Libraries && ln -s RMRBSeqs.embl RepeatMaskerLib.embl)
./Configure.pl
# RepBase EMBL: /srv/projects/db/repbase/23.07.embl
# RepeatMaskerLib.embl: /srv/projects/db/repbase/20170127/Libraries
```

## Run the installation script

The "installation" script simply just symlinks important Perl scripts into bin/

```
mkdir /opt/linux/centos/7.x/x86_64/pkgs/teclass/2.1.3/bin
./Install.sh /opt/linux/centos/7.x/x86_64/pkgs/teclass/2.1.3/bin
```
