https://github.com/RabbitBio/RabbitTClust

installed from github 

```
mkdir -p /opt/linux/centos/8.x/x86_64/src/r/rabbitclust
pushd /opt/linux/centos/8.x/x86_64/src/r/RabbitTClust
git clone --recursive https://github.com/RabbitBio/RabbitTClust.git
cd RabbitTClust
./install.sh

rsync -a clust-mst clust-greedy /opt/linux/centos/8.x/x86_64/pkgs/rabbitclust/2.3.0/bin/
rsync -a LICENSE.txt README.md /opt/linux/centos/8.x/x86_64/pkgs/rabbitclust/2.3.0/
```
