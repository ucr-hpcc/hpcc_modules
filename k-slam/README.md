#!/bin/bash -l


## install
```bash
module load boost/1.64.0
git clone https://github.com/aindj/k-SLAM.git
cd k-SLAM/build
make
cp SLAM <install-dir>
cd ..
cp install_slam.sh <install-dir>
cp install_slam_new_db.sh <install-dir>

```


## Running

```bash
module load k-slam
SLAM
```

