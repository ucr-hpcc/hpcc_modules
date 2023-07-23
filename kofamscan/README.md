
installed by 
```
mkdir -p opt/linux/centos/8.x/x86_64/pkgs/kofamscan/1.3
cd /opt/linux/centos/8.x/x86_64/pkgs/kofamscan/1.3
mamba create -p ./env  -c conda-forge -c bioconda kofamscan
```

Created config.yaml in /opt/linux/centos/8.x/x86_64/pkgs/kofamscan/1.3.0/config
```
profile: /srv/projects/db/koscan/LATEST/profiles/eukaryote.hal
ko_list: /srv/projects/db/koscan/LATEST/ko_list
hmmsearch: /opt/linux/centos/8.x/x86_64/pkgs/kofamscan/1.3.0/env/bin/hmmsearch
parallel: /opt/linux/centos/8.x/x86_64/pkgs/kofamscan/1.3.0/env/bin/parallel
cpu: 8
```
