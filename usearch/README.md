# USEARCH
Fast sequence search tool for molecular ecology and other metegenomic amplicon processing
see http://drive5.com/usearch/ and http://drive5.com/uparse/

## Prep
Precompiled EXE must register for download - currently used jason.stajich@gmail.com as contact for now
``` 
```

## Compile
```
```

## Install
```
mv usearch8.0.1623_i86linux32 $MODULEDIR/bin/usearch8.0.1623_i86linux32
cd $MODULEDIR/bin
ln -s usearch8.0.1623_i86linux32 usearch
cd $MODULEDIR/scripts
wget http://drive5.com/python/python_scripts.tar.gz
tar zxf python_scripts.tar.gz
wget http://www.drive5.com/otupipe/readmap2qiime.txt
mv readmap2qiime.txt readmap2qiime.py
```

## Cleanup
```
cd $MODULEDIR/scripts
rm python_scripts.tar.gz
```
