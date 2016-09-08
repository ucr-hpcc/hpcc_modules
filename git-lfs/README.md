# git-lfs
See https://github.com/github/git-lfs/ and
https://github.com/github/git-lfs/releases/tag/v1.4.1
## Prep
``` 
```

## Compile
```
```

## Install
```
module load git
wget https://github.com/github/git-lfs/releases/download/v1.4.1/git-lfs-linux-amd64-1.1.4.tar.gz
tar zxf git-lfs-linux-amd64-0.5.4.tar.gz
perl -i.bak -p -e 's!prefix=\S+!prefix="/opt/linux/centos/7.x/x86_64/pkgs/git-lfs/1.1.4"!'
bash install.sh
```

## Cleanup
```
```
