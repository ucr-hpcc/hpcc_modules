See https://bitbucket.org/berkeleylab/checkv/src/master/
```
cd /srv/projects/db/CheckV
wget https://portal.nersc.gov/CheckV/checkv-db-v0.6.tar.gz
tar -zxvf checkv-db-v0.6.tar.gz
ln -s checkv-db-v0.6 0.6
rm current && ln -s 0.6
