# Install

## Pre
Install event headers:

```
yum install event-devel
```

Load an older version of MPI for meme 4.9.1:

```bash
module unload openmpi
module load openmpi/3.1.4-slurm-19.05.0
```

Make sure everything is clean:

```bash
make distclean
```

## Build

Configure, compile and install under prefix path:

```
./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/meme/4.9.1 --with-url=http://meme.nbcr.net/meme --enable-build-libxml2 --enable-build-libxslt && make && make install
```


## notes
For 4.11 - I had to go in and fix perl headers in the scripts in bin as they used '#!/usr/bin/perl' which is problem when some external perl modules are neded (eg XML::Parser::Expect)
