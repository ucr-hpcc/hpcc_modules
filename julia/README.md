## Install
### Julia

The Julia install is very straight forward.

Download the latest version of the Julia precompiled binaries to `$HPCC_MODULES/../src/j/julia/` (1.8.4 is the latest at the time of writing).

https://julialang.org/downloads/

```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.4-linux-x86_64.tar.gz
```

Extract the package.

```bash
tar -xvf julia-1.8.4-linux-x86_64.tar.gz
```

Move the extracted `julia-[version]` file to `$HPCC_MODULES/julia/`

```bash
mv julia-1.8.4 $HPCC_MODULES/julia/1.8.4
```

### Module File

Create the module file for the new version, using the previous version as a template.