
Downloaded from 
http://opal.biology.gatech.edu/genemark/license_download.cgi

Fix the perl paths to be forced to the installed system which has the necessary dependent modules
```
perl -i.bak -p -e 's/\#\!\/usr\/bin\/perl/#!\/usr\/bin\/env perl/'  *.pl
```

# Key

As part of the module loading a symlink to the $GENEMARK_PATH/gm_key_6 will be made in ~/.gm_key


# these were old directions 
Users need to copy gm_key_64 to their folder 

cp $GENEMARK_PATH/gm_key_64 ~/.gm_key

# dependencies
Several perl modules are needed. 
- YAML
- Parallel::ForkManager 
- MCE::Mutex

These are part of funannotate conda env and miniconda3
