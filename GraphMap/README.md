# Install, Download
```
git clone https://github.com/isovic/graphmap.git  
```

Uncompress
```
```
Prep and Build
```
cd graphmap
make modules
make
```

Deploy
```
rsync -a bin/Linux-x64/graphmap ../../pkgs/GraphMap/0.3.1/bin
rsync -a docs scripts README.md ../../pkgs/GraphMap/0.3.1/
```
