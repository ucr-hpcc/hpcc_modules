## Install
### R
First, become pkgadmin (sudo or ssh keys).
Then access a compute node:
```bash
srun -p batch --mem=20gb --cpus-per-task=10 --time=1-00:00:00 --pty bash -l
```

Go to source directory, download R source and extract it:
```bash
cd /opt/linux/centos/7.x/x86_64/src/R 
wget https://cran.r-project.org/src/base/R-4/R-4.1.1.tar.gz
tar -xf R-4.1.1.tar.gz
cd R-4.1.1
```

Copy over previous install script, be sure to update the install path:
```bash
cp ../R-4.1.0/hpcc_configure.sh .
vim hpcc_configure.sh
```
The `hpcc_configure.sh` script should have simliar code as the following:
```bash
./configure \
--prefix /opt/linux/centos/7.x/x86_64/pkgs/R/4.1.1 \
--enable-R-shlib \
--enable-BLAS-shlib \
--enable-shared \
--enable-static \
--with-blas \
--with-lapack \
--with-libpng \
--with-jpeglib \
--with-x

if [[ $? -eq 0 ]]; then
    make
fi

fi [[ $? -eq 0 ]]; then
    make install
fi
```

After R is installed copy the following code into a file called `$R_INSTALL_DIR/lib64/R/etc/Rprofile.site`:

```R
local({
    setHook(packageEvent("grDevices", "onLoad"),function(...)
    grDevices::X11.options(type='cairo'))
    options(device='x11')
    options(bitmapType='cairo')
})
```

This is used to set options to allow RStudio Server to plot graphs.

## Add Module
The next step is to create a new module file, like this [example](https://github.com/ucr-hpcc/hpcc_modules/blob/master/R/4.1.0_gcc-8.3.0), and push it to the GitHub Repo.

### Bioconductor
Install the latest compatible version of Bioconductor as pkgadmin and with the correct version of R via module load.
From within R run the following:
```r
install.packages("BiocManager")
BiocManager::install(version = "3.14")
Update all/some/none? [a/s/n]: a # Update all packages
```

### Packages
#### Base
Install all pckages that exist in previous version of R.
First, become pkgadmin (sudo or ssh keys).
Then access compute node and run the following:
```bash
srun --p batch --mem=10gb --ntasks=10 --time=1-00:00:00 --pty bash -l

module load R/4.1.0_gcc-8.3.0 # To get list of old packages
R
```

```r
pkgs <- rownames(installed.packages())
writeLines(pkgs, "/tmp/pkgs")
q()
```

```bash
module switch R/4.1.1_gcc-8.3.0
R
```

```r
pkgs <- readLines("/tmp/pkgs")
BiocManager::install(pkgs) # will take some time...
```

Double check what is still missing and load/install dependencies to resolve issues:
```r
pkgs2 <- rownames(installed.packages())
missing <- pkgs[!pkgs %in% pkgs2] # Return names of packages that failed to install
BiocManager::install(missing) # Install those missing packages
q()
```
Some packages may require additional RPMs to be installed or modules to load.
Additionally, some packages may only exist from a GitHub repo and cannot be installed with the above method (ie. `RenvModule` and `RenvCheck` are here: `https://github.com/jdhayes/`).

#### RenvModule

This module will be used later, so better to install it first:

```r
library(devtools)
install_github("jdhayes/RenvModule")
```

#### RGeos

The package `RGeos` may requires the `geos` headers, which are installed under:

```
/opt/linux/centos/7.x/x86_64/pkgs/geos/3.7.1/include/
```

Loading the module should allow R to find the above path:

```r
module('load','geos/3.7.1')
BiocManager::install('rgeos')
```

#### rJava
Set paths in order to install `rJava` (ie. LD_LIBRARY_PATH=/path/to/libjvm.so):

```bash
module load java/8
R CMD javareconf
```

```r
BiocManager::install('rJava')
```

#### RPostgreSQL

Install additional header file `libpq-fe.h` for `RPostgreSQL` to install correctly:

```bash
yum install postgresql-devel
```

```r
install.packages("RPostgreSQL")
# Re install dependent packages (some not available?)
BiocManager::install(c("GWASdata", "GWASTools", "rcdklibs", "RankProd", "xcms", "mzR", "rgeos", "ncdf4", "rJava"))
```

#### ChemmineOB

ChemmineOB needs special attention.
First, become pkgadmin (sudo or ssh keys).
Then access a compute node and run the following:

```bash
srun --p batch --mem=10gb --ntasks=10 --time=1-00:00:00 --pty bash -l

module load openbabel
wget www.bioconductor.org/packages/release/bioc/src/contrib/ChemmineOB_1.16.0.tar.gz
R CMD INSTALL --configure-args='--with-openbabel-include=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2/include/openbabel-2.0 --with-
openbabel-lib=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2/lib' ChemmineOB_1.16.0.tar.gz
```

#### Install Rmpi

Download latest Rmpi version using wget. Make sure you have the proper R version loaded and then run the following:

```bash
wget https://cran.r-project.org/src/contrib/Rmpi_0.6-9.tar.gz```
```

Then install it like so:

```bash
R CMD INSTALL Rmpi_0.6-9.tar.gz --configure-args=--with-mpi=/opt/linux/centos/7.x/x86_64/pkgs/openmpi/4.0.1-slurm-19.05.0/
```

#### Install ChipSeek

First get the units and udunits2 prereqs, then install `ChipSeek`:

```bash
sudo yum install udunits2-devel
```

```r
install.packages("udunits2",configure.args='--with-udunits2-include=/usr/include/udunits2')

BiocManager::install("ChIPseeker")
```

#### Install rgdal

First, install some RPM dependencies:

```bash
yum install proj proj-devel proj-epsg
```

Next, load some dependencies with module load:

```bash
module load gdal
```

After that, you should be able to install `rgdal`
```R
install.packages('rgdal', configure.args='--with-include=/opt/linux/centos/7.x/x86_64/pkgs/gdal/2.1.3/include')
```

Then you can install `SpatialEpi`:

```R
install.packages('SpatialEpi')
```

#### Install Rmpfr
```
sudo yum install mpfr-devel
```

```
install.packages(Rmpfr)
```

#### Install clusterSim

```bash
sudo yum install mesa-libGLU-devel
```

```r
install.packages(clusterSim)
```


#### Misc Packages

__GitHub__

```r
library(devtools)
install_github('snoweye/pbdZMQ') # Available in CRAN, but only GitHub version installed
install_github("yduan004/drugbankR")
install_github("cmap/cmapR")
install_github("jdhayes/RenvCheck")
install_github("duncantl/RGoogleDocs")
install_github("jalvesaq/VimCom")
install_github("cran/setwidth")
install_github("jalvesaq/colorout")
install_github("cran/Geneland")
install_github('Sage-Bionetworks/rSynapseClient', ref='develop')
```

__Direct URL__

```r
install.packages("http://hartleys.github.io/QoRTs/QoRTs_LATEST.tar.gz",repos=NULL,type="source")
```

__Bioconductor__

```
BiocManager::install("tgirke/longevityDrugs", build_vignettes=FALSE, dependencies=FALSE)
BiocManager::install("tgirke/longevityTools", build_vignettes=FALSE, dependencies=FALSE)
```

### Upgrading R in RStudio Server

Modify paths in the following files:

```
/etc/rstudio/rserver.conf
/etc/rstudio/profiles # Pro Version Only
```

And lastly, and most important link the librarys to `lib64` since modifying `LD_LIBRARY_PATH` inside of RStudio server is not easily done:

```
ln -s /opt/linux/centos/7.x/x86_64/pkgs/R/4.0.3_gcc-8.3.0/lib64/R/lib/* /lib64/
```

Untested method, but it may be possible to just add paths like so:

```bash
sudo nano /etc/RStudio/rserver.conf
## rsession-ld-library-path=/opt/linux/centos/7.x/x86_64/pkgs/R/4.0.3_gcc-8.3.0/lib64/R/lib
sudo rstudio-server restart
```
