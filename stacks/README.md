## Stacks

Stacks requires GCC 4.9+, the extra GCC modules seem to only work on batch nodes.
Thus, one should compile two versions of this, one for batch and the other for intel.

[Stacks Website](http://catchenlab.life.illinois.edu/stacks/)

### Download and Install

```bash
wget http://catchenlab.life.illinois.edu/stacks/source/stacks-2.3b.tar.gz

tar -zxvf stacks-2.3b.tar.gz

cd stacks-2.3b

module load extra

module load GCCcore/6.3.0

mkdir /opt/linux/centos/7.x/x86_64/pkgs/stacks/2.3b

./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/stacks/2.3b

make

make install

```

## Create module for new version

```bash
cp stacks/2.1 stacks/2.3b

```

Edit paths in this new module file.

```bash
vi stacks/2.3b
```

