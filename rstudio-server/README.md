# RStudio-Server

Download the latest version from:
https://posit.co/download/rstudio-server/
or
https://docs.posit.co/previous-versions/rstudio.html

```bash
cd $HPCC_MODULES/../src/r/rstudio-server
wget URL_FROM_WEBSITE.rpm
```

Extract the rpm contents

```bash
mkdir tmp && cd tmp
rpm2cpio ../rstudio-server-rhel-2023.09.1-494-x86_64.rpm | cpio -idmv
mv ./usr/lib/rstudio-server $HPCC_MODULES/rstudio-server/2023.09.1-494
```

Copy files from previous version

```bash
cd $HPCC_MODULES/rstudio-server/2023.09.1-494
# The etc/ directory
cp -r ../2022.02.0-443/etc .

# The files for starting the rserver
cp ../2022.02.0-443/bin/start-* ./bin/
# Fix symbolic link
cd ./bin
rm start-rserver.sh
ln -s start-rserver_4.3.0.sh start-rserver.sh
sed -i 's/2022.02.0-443/2023.09.1-494/g' bin/*.sh

# rstudio_auth
cp ../2022.02.0-443/bin/rstudio_auth ./bin
```
