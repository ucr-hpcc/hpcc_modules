## Install
### mutt
First, become pkgadmin (sudo or ssh keys).
Then access a compute node:
```bash
srun -p batch --mem=20gb --cpus-per-task=10 --time=1-00:00:00 --pty bash -l
```

Go to source directory, download R source and extract it:
```bash
cd $HPCC_MODULES/../src/m/mutt
```

Download the latest version of mutt from http://www.mutt.org/download.html (2.2.9 at the time of writing)

```bash
wget http://ftp.mutt.org/pub/mutt/mutt-2.2.9.tar.gz
tar -xf mutt-2.2.9.tar.gz
cd mutt-2.2.9
```

Copy over previous install script, be sure to update the install path:
```bash
cp ../mutt-2.1.5/hpcc_install.sh .
vim hpcc_install.sh
## SOFT_VER='2.2.9' ## Update the mutt version!
./hpcc_install.sh
```

After running the script, you will need to manually change the group and permission of a file called `mutt_dotlock` located in `$HPCC_MODULES/mutt/$SOFT_VER/bin/`

```bash
chgrp mail $HPCC_MODULES/mutt/$SOFT_VER/bin/mutt_dotlock
chmod 2755 $HPCC_MODULES/mutt/$SOFT_VER/bin/mutt_dotlock
```

## Add Module
The next step is to create a new module file, like this [example](https://github.com/ucr-hpcc/hpcc_modules/blob/main/mutt/2.2.9), and push it to the GitHub Repo.
