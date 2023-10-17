available from https://phylosolutions.com/paup-test/
```
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/paup/4a168
pushd /opt/linux/centos/8.x/x86_64/pkgs/paup/4a168
curl -O https://phylosolutions.com/paup-test/paup4a168_centos64.gz
gunzip paup4a168_centos64.gz
chmod +x paup4a168_centos64
ln -s paup4a168_centos64 paup
popd
```
