
Downloaded from 
http://opal.biology.gatech.edu/genemark/license_download.cgi

Fix the perl paths to be forced to the installed system which has the necessary dependent modules
```
perl -i.bak -p -e 's/\#\!\/usr\/bin\/perl/#!\/usr\/bin\/env perl/'  *.pl
```

Users need to copy gm_key_64 to their folder 
cp $GENEMARK_PATH/gm_key_64 ~/.gm_key
