https://github.com/stephaneguindon/phyml

```
git clone https://github.com/stephaneguindon/phyml
cd phyml
module load oneapi
bash ./autogen.sh
CC=icc ./configure --enable-phyml --prefix=/opt/linux/centos/8.x/x86_64/pkgs/phyml/3.3.20220715
autoreconf -i
./configure --enable-phyml-mpi --prefix=/opt/linux/centos/8.x/x86_64/pkgs/phyml/3.3.20220715-mpi
```
