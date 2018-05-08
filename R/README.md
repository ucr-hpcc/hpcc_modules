## Install
### R
First, become pkgadmin (sudo or ssh keys).
Then access a compute node:
```bash
srun --p batch --mem=10gb --ntasks=10 --time=1-00:00:00 --pty bash -l
```

Go to source directory, download R source and extract it:
```bash
cd /opt/linux/centos/7.x/x86_64/src
wget https://cran.r-project.org/src/base/R-3/R-3.4.2.tar.gz
tar -xf R-3.4.2.tar.gz 
cd R-3.4.2
```

Copy over previous install script, be sure to update the install path:
```bash
cp ../R-3.4.0/iigb_configure.sh .
vim iigb_configure.sh
./iigb_configure.sh 
make -j 10
make install
```

After R is installed install the module.

### Bioconductor
Install Bioconductor as pkgadmin and with the correct version of R via module load.
From within R run the following:
```r
source("https://bioconductor.org/biocLite.R")
biocLite()
Update all/some/none? [a/s/n]: a # Update all packages
```
#### Development (leading-edge)
To enable the development version of Bioconductor run the following from within R:
```r
BiocInstaller::useDevel()
```

### Packages
#### Base
Install all pckages that exist in previous version of R.
First, become pkgadmin (sudo or ssh keys).
Then access compute node and run the following:
```bash
srun --p batch --mem=10gb --ntasks=10 --time=1-00:00:00 --pty bash -l

module load R/3.4.0 # To get list of old packages
R
```
```r
source("http://bioconductor.org/biocLite.R")
pkgs <- rownames(installed.packages())
writeLines(pkgs, "/tmp/pkgs")
q()
```
```bash
module switch R/3.4.2
module load nfcd #netcdf4, Rhdf5lib
R
```
```r
pkgs <- readLines("/tmp/pkgs")
source("http://bioconductor.org/biocLite.R")
biocLite(pkgs) # will take some time...
```

Double check what is still missing and load/install dependencies to resolve issues:
```r
pkgs2 <- rownames(installed.packages())
missing <- pkgs[!pkgs %in% pkgs2] # Return names of packages that failed to install
biocLite(missing) # Install those missing packages
install.packages("/bigdata/girkelab/shared/modules_1.2.tar.gz", repos=NULL) # Maintained by Tyler

q()
```

#### RGeos
Currently the libgeos-dev package is only installed on Pigeon (epel?), thus install from pigeon:
```r
biocLite('rgeos')
```

#### rJava
Set paths in order to install rJava (ie. LD_LIBRARY_PATH=/path/to/libjvm.so):
```bash
module load java/8
R CMD javareconf -e 
```
```r
biocLite('rJava')
```

#### RPostgreSQL
Additional header file (libpq-fe.h) required for RPostgreSQL to install correctly:
```bash
yum install postgresql-devel
```
```r
install.packages("RPostgreSQL")
# Re install dependent packages (some not available?)
biocLite(c("GWASdata", "GWASTools", "rcdklibs", "RankProd", "xcms", "mzR", "rgeos", "ncdf4", "rJava"))
```

#### Github repositories
3rd Party packages that are used:
```r
library(devtools)
biocLite("tgirke/longevityDrugs", build_vignettes=FALSE, dependencies=FALSE)
biocLite("tgirke/longevityTools", build_vignettes=FALSE, dependencies=FALSE)
install_github("duncantl/RGoogleDocs")
install_github("jalvesaq/VimCom")
install_github("cran/setwidth")
install_github("jalvesaq/colorout")
install_github("cran/Geneland")
install_github("RenvCheck", "ucr-bioinformatics")
install_github('Sage-Bionetworks/rSynapseClient', ref='develop')
install.packages("http://hartleys.github.io/QoRTs/QoRTs_LATEST.tar.gz",repos=NULL,type="source")
devtools::install_github("cmap/cmapR")
```

#### ChemmineOB
ChemmineOB needs special attention.
First, become pkgadmin (sudo or ssh keys).
Then access a compute node and run the following:
```bash
srun --p batch --mem=10gb --ntasks=10 --time=1-00:00:00 --pty bash -l

module load openbabel
wget www.bioconductor.org/packages/release/bioc/src/contrib/ChemmineOB_1.14.0.tar.gz
R CMD INSTALL --configure-args='--with-openbabel-include=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2/include/openbabel-2.0 --with-
openbabel-lib=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2/lib' ChemmineOB_1.16.0.tar.gz
```

#### Install Rmpi
Download latest Rmpi version using wget. Make sure you have the proper R version loaded and then run the following:
```r
wget http://www.stats.uwo.ca/faculty/yu/Rmpi/download/linux/Rmpi_0.6-7.tar.gz
R CMD INSTALL Rmpi_0.6-7.tar.gz --configure-args=--with-mpi=/opt/linux/centos/7.x/x86_64/pkgs/openmpi/2.0.1-slurm-16.05.4/
```

#### Install ChipSeek
First get the units and udunits2 prereqs.
```bash
install.packages("udunits2",configure.args='--with-udunits2-include=/usr/include/udunits2')
biocLite("ChIPseeker")
```


### Upgrading R Version on RStudio Server
Modify paths in the following files:
```
/etc/rstudio/rserver.conf
/etc/rstudio/profiles # Pro Version Only
```

And lastly, and most important:
```ln -s /opt/linux/centos/7.x/x86_64/pkgs/R/3.4.2/lib64/R/lib/* /lib64/```

