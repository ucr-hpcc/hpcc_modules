# Plumed

Installation instructions are available in the plumed documentation:

`https://www.plumed.org/doc-v2.9/user-doc/html/_installation.html`

Can copy the `hpcc_install.sh` script from the original/previous install into new version.

## Modulefile

Plumed provides a module file to use. The path is output in the `make install` command. The 2.9.0 version is found at the following path:
```
/opt/linux/rocky/8.x/x86_64/pkgs/plumed/2.9.0/lib/plumed/modulefile
```

## Testing

```
srun -p short -t 2:00:00 -c 2 -N 6 --mem=16GB --pty bash -l
module purge
module load openmpi slurm
cd $HPCC_MODULES/../src/p/plumed/plumed-2.9.0
make check
```

