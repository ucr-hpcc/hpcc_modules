# Install

Download the binaries and uncompress them under the install location.
It may also be useful to download the source code and also place it under the install location under a directory called `src`.
There are some examples under the `data` directory that users may find useful.

# Compile

It seems to be much easier to install the binaries, but in case you really want to do this, here is something that might help you get started:

```
# Load modules, although stack is probably all you will need
module load ghc
module load stack
module load cabal

# This actually installs a .local version of ghc that is compatible with the current "project" you want to build
stack setup

# After things are setup, then build and then install binaries under specified path
stack install --local-bin-path /path/to/install/bin
```
