# PIPITS
PIPITS is an automated pipeline for analyses of fungal internal transcribed spacer (ITS) sequences from the Illumina sequencing platform.

Depends on vsearch, hmmer, usearch, fastx_toolkit
## Prep
``` 
wget https://github.com/hsgweon/pipits/releases/download/1.4.0/pipits-1.4.0.tar.gz
```

## Compile
```
tar zxf pipits-1.4.0.tar.gz
```

## Install
```
cd pipits-1.4.0
python setup.py --prefix /opt/linux/centos/7.x/x86_64/pkgs/pipits/1.4.0
cd  /opt/linux/centos/7.x/x86_64/pkgs/pipits/1.4.0

wget https://sourceforge.net/projects/rdp-classifier/files/rdp-classifier/rdp_classifier_2.12.zip
unzip rdp_classifier_2.12.zip
ln -s rdp_classifier_2.12/dist/classifier.jar ./classifier.jar

mkdir refdb
cd refdb
wget https://sourceforge.net/projects/pipits/files/warcup_retrained_V2.tar.gz
wget wget https://unite.ut.ee/sh_files/uchime_reference_dataset_01.01.2016.zip
wget http://sourceforge.net/projects/pipits/files/UNITE_retrained_22.08.2016.tar.gz
tar zxf UNITE_retrained_22.08.2016.tar.gz
tar zxf warcup_retrained_V2.tar.gz
unzip uchime_reference_dataset_01.01.2016.zip
```

## Cleanup
```
```
