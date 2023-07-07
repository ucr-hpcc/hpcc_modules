
Manual build of ncbi-fcs-gx and copy of files from 'dist' folder - see /opt/linux/centos/8.x/x86_64/src/n/ncbi-fcs-gx
checked out via https://github.com/ncbi/fcs-gx.git

```
git clone https://github.com/ncbi/fcs-gx.git
cd fcs-gx
make
mkdir -p /opt/linux/centos/8.x/x86_64/pkgs/ncbi-fcs/0.4.0/bin/
rsync -a build/src/gx scripts/run_gx.py scripts/sync_files.py scripts/classify_taxonomy.py make_gxdb/blast_names_mapping.tsv scripts/action_report.py /opt/linux/centos/8.x/x86_64/pkgs/ncbi-fcs/0.4.0/bin/
```
