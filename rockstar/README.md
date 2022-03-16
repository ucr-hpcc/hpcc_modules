# Rockstar

# Prep

Ensure RPM is installed (admins only):

```bash
sudo dnf install libtirpc-devel
```

# Download

Get source from github:

```bash
git clone https://github.com/kyleaoman/rockstar.git
```

We can also get it from bitbucket, not sure which is better:

```bash
git clone https://bitbucket.org/gfcstanford/rockstar.git
```

# Patch

You need to patch the `Makefile` on RHEL8 systems in order for it to find `rpc`:

```diff
9c9
< HDF5_FLAGS = -DH5_USE_16_API -lhdf5 -DENABLE_HDF5 -I/opt/local/include -L/opt/local/lib -ltirpc -I/usr/include/tirpc
---
> HDF5_FLAGS = -DH5_USE_16_API -lhdf5 -DENABLE_HDF5 -I/opt/local/include -L/opt/local/lib
```

# Build

Run `make`:

```
make with_hdf5
```

