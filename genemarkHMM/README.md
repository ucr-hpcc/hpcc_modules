
Downloaded from 
http://opal.biology.gatech.edu/genemark/license_download.cgi

Fix the perl paths to be forced to the installed system which has the necessary dependent modules
```
perl -i.bak -p -e 's!/usr/bin/perl!/opt/linux/centos/7.x/x86_64/pkgs/perl/5.20.2/bin/perl!' *.pl
```

Users need to copy gm_key_64 to their folder 
cp /opt/linux/centos/7.x/x86_64/pkgs/genemarkHMM/4.33/gm_key_64 ~/.gm_key
