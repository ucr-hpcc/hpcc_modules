# interproscan

## Prep

This location no longer works:
https://github.com/ebi-pf-team/interproscan/wiki/HowToDownload

Try this instead:
https://github.com/ebi-pf-team/interproscan/releases

## Compile

Download and extract pftools:

```bash
wget https://github.com/sib-swiss/pftools3/archive/refs/tags/v3.2.11.tar.gz
tar -xf v3.2.11.tar.gz
```

Configure without `AFFINITY`:

```bash
mkdir pftools3-3.2.11/build
cd pftools3-3.2.11/build
cmake -DUSE_AFFINITY=OFF -DCMAKE_INSTALL_PREFIX:PATH=$HPCC_MODULES/pftools/3.2.11 ..
```

Build:

```bash
make && make install && make test
```

Replace each existing interproscan binary with symlink:

```
cd $HPCC_MODULES/iprscan/5.54-87.0/bin/prosite
mkdir altbin2
for file in $(find . -maxdepth 1 -type f); do
  if [[ -f $HPCC_MODULES/pftools/3.2.11/bin/$file ]]; then
    mv $file altbin2/$file
    ln -s $HPCC_MODULES/pftools/3.2.11/bin/$file
  fi
done
```

## Install
```
# Main Installation
cd /opt/linux/centos/7.x/x86_64/pkgs/interproscan/
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.48-83.0/interproscan-5.48-83.0-64-bit.tar.gz
wget ftp://ftp.ebi.ac.uk/pub/software/unix/iprscan/5/5.48-83.0/interproscan-5.48-83.0-64-bit.tar.gz.md5

# Recommended checksum to confirm the download was successful:
md5sum -c interproscan-5.48-83.0-64-bit.tar.gz.md5
mv interproscan-5.48-83.0 5.48-83.0
```

# go into the folder and 
Create symlinks to third-party binaries in the bin/ folder - usually these are symlinks to installs on our system
Packages: SignalP, Phobius, TMHMM
Use a previous version for reference


Need to also run this after downloading and unpacking to index databases
```
python initial_setup.py
```

Finally we need to add an option because of the version of Java 13 that causes failures

Error messages were throughout:
```Failed to exec spawn helper```

Googled for that:
https://stackoverflow.com/questions/61301818/java-failed-to-exec-spawn-helper-error-since-moving-to-java-14-on-linux

In the last part of answers

An alternative workaround is to add the following java option:
```
-Djdk.lang.Process.launchMechanism=vfork
```

added that bit to the `/opt/linux/centos/7.x/x86_64/pkgs/interproscan/5.48-83.0/interproscan.sh`
so the end of that script goes from:
```
"$JAVA" \
-XX:+UseParallelGC -XX:ParallelGCThreads=4  \
 -Xms1028M -Xmx6072M \
-jar  interproscan-5.jar $@ -u $USER_DIR
```
to
```
"$JAVA" \
-XX:+UseParallelGC -XX:ParallelGCThreads=4  \
 -Xms1028M -Xmx6072M -Djdk.lang.Process.launchMechanism=vfork \
-jar  interproscan-5.jar $@ -u $USER_DIR
```

## Cleanup
```
module load interproscan/5.48-83.0
# Run interproscan.sh to reveal any missing packages
/opt/linux/centos/7.x/x86_64/pkgs/interproscan/5.48-83.0/interproscan.sh
```

