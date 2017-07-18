
## Install R from Source on Biocluster
## Date: May 1, 2017
## Note: R-3.4.0_release and R-3.4.0_devel had to be installed separately at that time!
## Install steps for release are labelled (a) and for devel (b)


## (1) Install R from source
## (a) R/release
```srun --mem=10gb --cpus-per-task 1 --ntasks 1 --time 10:00:00 --pty bash -l
ssh pkgadmin@localhost
cd /opt/linux/centos/7.x/x86_64/src
## Look up latest R version and download it
wget https://cran.r-project.org/src/base/R-3/R-3.4.0.tar.gz
gunzip R-3.4.0.tar.gz 
tar -xvf R-3.4.0.tar
cd R-3.4.0
cp ../R-3.0.1/R-3.0.1/iigb_configure.sh .
# Change everything in iigb_configure.sh to R-3.4.0 for release
vim iigb_configure.sh
./iigb_configure.sh 
make # takes 30 min
make install # this creates dir /opt/R/3.1.0-release
ldd /opt/R/3.4.0-release/lib64/R/lib/libR.so
ldd /opt/R/3.4.0-release/lib64/R/lib/libRblas.so
```

## (b) R/dev
```srun --mem=10gb --cpus-per-task 1 --ntasks 1 --time 10:00:00 --pty bash -l
ssh pkgadmin@localhost
cd  /opt/linux/centos/7.x/x86_64/src
```
## Look up latest R version and download it
```
mkdir R-3.4.0-dev; cd R-3.4.0-dev
wget ftp://ftp.stat.math.ethz.ch/Software/R/R-devel_2014-05-05.tar.gz # for development version of R
gunzip R-devel_2014-05-05.tar.gz
tar -xvf R-devel_2014-05-05.tar
cd R-devel; mv * ..; cd ..; rmdir R-devel # Give desired name
cp ../R-3.0.2-dev/iigb_configure.sh .
```
# Change everything in iigb_configure.sh to R-3.1.0-dev for developer 
```
vim iigb_configure.sh 
./iigb_configure.sh 
make # takes 30 min
make install # this creates dir /opt/R/3.1.0-dev
ldd /opt/R/3.1.0-dev/lib64/R/lib/libR.so
ldd /opt/R/3.1.0-dev/lib64/R/lib/libRblas.so 
```

## (2) Set proper group permissions
## (a) R/release
## this needs to be done on biocluster directly
```ssh pkgadmin@localhost
cd /opt/R/3.4.0-release
```
## (b) R/dev
## this needs to be done on biocluster directly
```ssh pkgadmin@localhost
cd /opt/R/3.4.0-dev
```

## (3) Module system updates ##
## Next two steps only required when you do things for the first time
```cd /rhome/tgirke/; mkdir git; cd git
git clone git@github.com:ucr-bioinformatics/biocluster-modules.git
```
## (a) R/release
## Always required
```cd ~/biocluster-modules/R
cp 3.0.2 3.4.0 
vim 3.4.0 # change everything to 3.4.0-release in this file
git pull
git add 3.4.0
git commit -am "3.4.0"
git push
```
## (b) R/dev
## Always required 
```cd ~/biocluster-modules/R
cp 3.4.0-release 3.4.0-dev 
vim 3.4.0-dev # change everything to 3.4.0-dev in this file
git pull
git add 3.4.0-dev
git commit -am "3.4.0-dev"
git push
```

## (4) Install all previous R packages
## (a) R/release
```srun --mem=10gb --cpus-per-task 1 --ntasks 1 --time 10:00:00 --pty bash -l
ssh pkgadmin@localhost
module load R/3.4.0 # To get list of old packages
R
source("http://bioconductor.org/biocLite.R")
pkgs <- rownames(installed.packages())
writeLines(pkgs, "/rhome/your_username/pkgs")
q()
module load R/3.4.0-release
R
pkgs <- readLines("/rhome/your_username/pkgs")
source("http://bioconductor.org/biocLite.R")
biocLite(pkgs) # will take some time...

pkgs2 <- rownames(installed.packages())
missing <- pkgs[!pkgs %in% pkgs2] # Return names of packages that failed to install
biocLite(missing) # Install those missing packages
install.packages("/bigdata/girkelab/shared/modules_1.2.tar.gz", repos=NULL) # Maintained by Tyler

pkgs <- readLines("/rhome/your_username/pkgs")
source("http://bioconductor.org/biocLite.R")
biocLite(pkgs) # will take some time...

pkgs2 <- rownames(installed.packages())
missing <- pkgs[!pkgs %in% pkgs2] # Return names of packages that failed to install
biocLite(missing) # Install those missing packages
install.packages("/bigdata/girkelab/shared/modules_1.2.tar.gz", repos=NULL) # Maintained by Tyler
```
## Install ChemmineOB 
```q()
module load openbabel
wget www.bioconductor.org/packages/release/bioc/src/contrib/ChemmineOB_1.14.0.tar.gz
R CMD INSTALL --configure-args='--with-openbabel-include=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2/include/openbabel-2.0 --with-
openbabel-lib=/opt/linux/centos/7.x/x86_64/pkgs/openbabel/2.3.2/lib' ChemmineOB_1.14.0.tar.gz
```
## Install RPostgreSQL (do on biocluster directly)
```install.packages("RPostgreSQL")
biocLite("GWASdata", "GWASTools", "rcdklibs", "RankProd", "xcms", "mzR", "rgeos", "ncdf4", "rJava")
```
#Github repositories
```library(devtools)
biocLite("tgirke/longevityDrugs", build_vignettes=FALSE, dependencies=FALSE)
biocLite("tgirke/longevityTools", build_vignettes=FALSE, dependencies=FALSE)
install_github("duncantl/RGoogleDocs")
install_github("jalvesaq/VimCom")
install_github("cran/setwidth")
install_github("jalvesaq/colorout")
install_github("cran/Geneland")
```
## Install Rmpi (Jordan's instructions)
Download latest Rmpi version using wget
```R CMD INSTALL Rmpi_0.6-5.tar.gz --configure-args=--with-mpi=/opt/linux/centos/7.x/x86_64/pkgs/openmpi/2.0.1-slurm-16.05.4/
```
## (b) R/dev
```module unload R
module load R/3.4.0-dev
R
Go to https://www.bioconductor.org/developers/how-to/useDevel/ and follow instructions
library(BiocInstaller)
useDevel()

source("http://bioconductor.org/biocLite.R")
pkgs <- readLines("/rhome/your_username/pkgs")
biocLite(pkgs) # Note: it was not necessary to run useDevel(devel=TRUE) to specify Bioc-devel
```
## Follow steps under (4a) -> ...

## (5) Change default R to new release version ##
## Do after you have tested everything
```cd ~/git/biocluster-modules/main/R
vim .version
git commit -am "set R-3.4.0-release to default"
git push
```
## (6) Upgrading R Version on RStudio Server
Modify paths in the following files:
```/etc/rstudio/rserver.conf
   /etc/rstudio/profiles``` #This only applies to the Pro version

And lastly, and most important:
```ln -s /opt/linux/centos/7.x/x86_64/pkgs/R/3.2.2/lib64/R/lib/* /lib64/```
