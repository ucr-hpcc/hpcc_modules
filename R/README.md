## Install
### R

First, become pkgadmin (sudo or ssh keys). Then access a compute node.

```bash
sudo su - pkgadmin
srun --x11 --partition=girkelab --mem=20gb --cpus-per-task 1 --ntasks 10 --time 48:00:00 --pty bash -l # change partition as needed
# -> assigned node was i04 on 15Jun2023  
```

Go to source directory, download the source of the latest R release version from the CRAN [here](https://cran.r-project.org/src/base/).
```bash
cd /opt/linux/centos/8.x/x86_64/src/r/R
# cd /opt/linux/centos/7.x/x86_64/src/R 
wget https://cran.r-project.org/src/base/R-4/R-4.3.0.tar.gz
tar -xf R-4.3.0.tar.gz
cd R-4.3.0
```

Copy over previous [hpcc_install.sh](https://github.com/ucr-hpcc/hpcc_modules/blob/main/R/hpcc_install.sh) script and update the R version specified in the file. 

```bash
cp ../R-4.2.2/hpcc_install.sh .
vim hpcc_install.sh # Update R version under R_VER=4.3.0!
```

After R is installed copy the following code into a file called `/opt/linux/rocky/8.x/x86_64/pkgs/R/4.3.0/lib64/R/etc/Rprofile.site`:

```R
local({
    setHook(packageEvent("grDevices", "onLoad"),function(...)
    grDevices::X11.options(type='cairo'))
    options(device='x11')
    options(bitmapType='cairo')
})
```

This is used to set options to allow RStudio Server to plot graphs.

### Add new R version to module list
The following assumes that the GitHub repos [hpcc_modules](https://github.com/ucr-hpcc/hpcc_modules) has been cloned to `$MyLoc` on the cluster.

```sh
cd $MyLoc/hpcc_modules/R # ThG's MyLoc is MyLoc=~/bigdata/hpcc
git pull
cp 4.2.2 4.3.0
vim 4.3.0 # change everything to 4.3.0 in this file
git add 4.3.0; git commit -am "4.3.0"; git push
```

### Bioconductor packages
Install the latest compatible version of Bioconductor as pkgadmin and with the correct version of R loaded.

```sh
sudo su - pkgadmin
srun -p batch --mem=20gb --cpus-per-task 1 --ntasks 10 --time 48:00:00 --pty bash -l # change partition as needed
module purge
module load java
module load gcc/9.2.1
module load R/4.3.0
R
```

From within R run the following:

```r
install.packages("BiocManager")
BiocManager::install(version = "3.17")
Update all/some/none? [a/s/n]: a # Update all packages
```

#### Check Bioconductor version
```r
BiocManager::version() # This should return 3.17 for current release
```

#### Install Bioconductor core packages
```r
BiocManager::install(c("GenomicFeatures", "AnnotationDbi")) 
```

#### Install all packages from previous R version
Be sure to be logged in as `pkgadmin` with the srun session started under `pkgadmin` (required for proper environment setup)

(1) Get existing packages
```r
module load R/4.2.2 # To get list of old packages
R
pkgs <- rownames(installed.packages()) 
writeLines(pkgs, "~/pkgs_4.2.2") 
q() 
```
(2) Attempt to install new packages
```
module unload R
module load R/4.3.0
R
pkgs <- readLines("~/pkgs_4.2.2") # change write location as needed
BiocManager::install(pkgs)
```
(3) Often some packages may not install and need debugging. To find out which ones need extra work do:

**NOTE:** Some packages will fail to install even after multiple attempts, this is somewhat expected as some packages require special attention. Install packages from the `Special Packages` section below, then circle back here.

```r
pkgs2 <- rownames(installed.packages())
missing <- pkgs[!pkgs %in% pkgs2] # Return names of packages that failed to install
BiocManager::install(missing) # Install those missing packages
```

### Special Packages

Some packages may require additional RPMs to be installed or modules to load.
Additionally, some packages may only exist from a GitHub repo and cannot be installed with the above method (ie. `RenvModule` and `RenvCheck` are here: `https://github.com/jdhayes/`).

#### RenvModule

This module will be used later, so better to install it first:

```r
library(devtools)
install_github("jdhayes/RenvModule")
```

#### rJava
Set paths in order to install `rJava` (ie. LD_LIBRARY_PATH=/path/to/libjvm.so):

```bash
module load java
R CMD javareconf
```

```r
BiocManager::install('rJava')
```

#### RPostgreSQL

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
srun --partition=batch --mem=10gb --ntasks=10 --time=1-00:00:00 --pty bash -l
module unload R
module load R/4.3.0
module load openbabel
wget https://bioconductor.org/packages/release/bioc/src/contrib/ChemmineOB_1.38.0.tar.gz
R CMD INSTALL --configure-args='--with-openbabel-include=/opt/linux/centos/8.x/x86_64/pkgs/openbabel/3.1.1/include/openbabel3 --with-openbabel-lib=/opt/linux/centos/8.x/x86_64/pkgs/openbabel/3.1.1/lib/openbabel/3.1.0/' ChemmineOB_1.38.0.tar.gz
```

#### Install Rmpi

Download latest Rmpi version using wget. Make sure you have the proper R version loaded and then run the following:

```bash
wget https://cran.r-project.org/src/contrib/Rmpi_0.6-9.tar.gz
```

Then install it like so:

```bash
module load openmpi
R CMD INSTALL Rmpi_0.6-9.tar.gz --configure-args='--with-mpi=/opt/linux/rocky/8.x/x86_64/pkgs/openmpi/4.1.2_slurm-23.02.2_mpi1-compat'
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

```r
install.packages("Rmpfr")
```

#### Install clusterSim

```bash
sudo yum install mesa-libGLU-devel
```

```r
install.packages("clusterSim")
```

#### av

Download the latest version from Cran

```sh
wget https://ftp.osuosl.org/pub/cran/src/contrib/av_0.8.3.tar.gz
R CMD INSTALL --configure-vars='INCLUDE_DIR=/opt/linux/rocky/8.x/x86_64/pkgs/ffmpeg/5.0/include LIB_DIR=/opt/linux/rocky/8.x/x86_64/pkgs/ffmpeg/5.0/lib' av_0.8.3.tar.gz
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
install_github("gabrielrvsc/BooST")
install_github("keleslab/BandNorm")
install_github('xuranw/MuSiC')
#install_github("cran/Geneland")
#install_github('Sage-Bionetworks/rSynapseClient', ref='develop')
```

__Direct URL__

```r
install.packages("http://hartleys.github.io/QoRTs/QoRTs_LATEST.tar.gz",repos=NULL,type="source")
```

### Upgrading R in RStudio Server

Modify paths in the following files:

```
/etc/rstudio/rserver.conf
/etc/rstudio/profiles # Pro Version Only
```

And lastly, update the libraries for inside of RStudio:

```bash
sudo nano /etc/RStudio/rserver.conf
## rsession-ld-library-path=/opt/linux/centos/7.x/x86_64/pkgs/R/4.0.3_gcc-8.3.0/lib64/R/lib
sudo rstudio-server restart
```
