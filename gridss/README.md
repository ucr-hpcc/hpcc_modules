See site Github site for GRIDSS

https://github.com/PapenfussLab/gridss
# Install
```
```
Download and Uncompress
```
cd /opt/linux/centos/7.x/x86_64/pkgs
mkdir -p gridss
cd gridss
wget https://github.com/PapenfussLab/gridss/archive/v1.4.3.tar.gz
tar zxf v1.4.3.tar.gz
mv gridss-1.4.3 1.4.3
cd 1.4.3
wget https://github.com/PapenfussLab/gridss/releases/download/v1.4.3/gridss-1.4.3-jar-with-dependencies.jar
ln -s gridss-1.4.3-jar-with-dependencies.jar gridss.jar

# IN module file set GRIDSS_JAR=`pwd`/gridss.jar
```
