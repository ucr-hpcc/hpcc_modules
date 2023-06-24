Installed from https://github.com/clwgg/nQuire

note no version number was declared so version installed is date of last commit + commit hash

```
cd /opt/linux/centos/8.x/x86_64/src/n/nQuire
git clone --recursive https://github.com/clwgg/nQuire
cd nQuire
make submodules
make
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/nQuire/2018-04-05-a990a88/bin
cp README.org LICENSE /opt/linux/centos/8.x/x86_64/pkgs/nQuire/2018-04-05-a990a88
cp nQuire /opt/linux/centos/8.x/x86_64/pkgs/nQuire/2018-04-05-a990a88/bin
```

