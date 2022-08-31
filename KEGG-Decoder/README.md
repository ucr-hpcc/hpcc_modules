
installed by
```
mkdir -p opt/linux/centos/8.x/x86_64/pkgs/KEGG-Decoder/1.3.0
cd /opt/linux/centos/8.x/x86_64/pkgs/KEGG-Decoder/1.3.0
mamba create -p ./env  -c conda-forge -c bioconda python=3.6
conda activate /opt/linux/centos/8.x/x86_64/pkgs/KEGG-Decoder/1.3.0/env
python3 -m pip install KEGGDecoder
```

Created config.yaml 
```
profile: /srv/projects/db/koscan/2022-06-02/profiles
ko_list: /srv/projects/db/koscan/2022-06-02/ko_list
hmmsearch: /opt/linux/centos/8.x/x86_64/pkgs/KEGG-Decoder/1.3.0/env/bin/hmmsearch
parallel: /opt/linux/centos/8.x/x86_64/pkgs/KEGG-Decoder/1.3.0/env/bin/parallel
cpu: 8
```
