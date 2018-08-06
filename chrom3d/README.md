# Install
## Get source code
```bash
wget https://github.com/Chrom3D/Chrom3D/archive/v1.0.1.tar.gz
```
OR
```bash
git clone https://github.com/CollasLab/Chrom3D.git
cd Chrom3D
```

## Extract
If you downloaded compressed tar.gz file:
```bash
tar -xf v1.0.1.tar.gz
cd Chrom3D-1.0.1
```

## Customize Makefile
Since we already have boost installed, we need to indicate where it is. Do not use boost/1.64.0 (it has a bug), use boost/1.63.0 instead:
```bash
vim Makefile
```
Update compilation line to look like this:
```
g++ -O3 -I /opt/linux/centos/7.x/x86_64/pkgs/boost/1.63.0/include -I $(TCLAPINCLUDE) $(SRCPATH)/Util.cpp $(SRCPATH)/Bead.cpp $(SRCPATH)/Chromosome.cpp $(SRCPATH)/Randomizer.cpp $(SRCPATH)/Constraint.cpp $(SRCPATH)/Model.cpp $(SRCPATH)/MCMC.cpp $(SRCPATH)/Chrom3D.cpp -o Chrom3D
```

## Compile
module load boost/1.63.0
make
