# Download
[Website](http://bioinformatics.psb.ugent.be/webtools/i-adhore/licensing/)


# Install

```bash
tar -xzvf i-adhore-xxx.tar.gz
cd i-adhore-xxx
```

From this directory, run the following commands:

```bash
mkdir build
cd build
cmake ..
```

A useful option to specify for the cmake command is CMAKE_INSTALL_PREFIX so that
you can tell cmake where to install the software. For example, to install in
your local $(HOME)/i-adhore directory you would run:

```bash
cmake .. -DCMAKE_INSTALL_PREFIX=$(HOME)/i-adhore
```

Afterwards run:

```bash
make
```

And to install run (as root if necessary):

```bash
make install
```
