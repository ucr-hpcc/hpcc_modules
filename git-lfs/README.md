# git-lfs
See https://github.com/github/git-lfs/ and
https://github.com/github/git-lfs/releases/tag/v0.5.4
## Prep
``` 
```

## Compile
```
```

## Install
```
wget https://github.com/github/git-lfs/releases/download/v0.5.4/git-lfs-linux-amd64-0.5.4.tar.gz
tar zxf git-lfs-linux-amd64-0.5.4.tar.gz
perl -i.bak -p -e 's!prefix=\S+!prefix="/opt/linux/centos/7.x/x86_64/pkgs/git-lfs/0.5.4"!'
bash install.sh
```

## Cleanup
```
```
