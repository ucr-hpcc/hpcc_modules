Viral Eukaryotic Bacterial Archaeal (VEBA)
https://github.com/jolespin/veba - is a set of conda envs

you should read the walkthrough
https://github.com/jolespin/veba/blob/main/walkthroughs/README.md and
https://github.com/jolespin/veba/blob/main/walkthroughs/end-to-end_metagenomics.md

replace the `source activate VEBA-XXX` with `module load veba/1.0.0-XXX`


```
for a in $(ls /opt/linux/centos/8.x/x86_64/pkgs/veba/1.0.0/envs | grep -v annotate_env | perl -p -e 's/VEBA-//; s/_env$//'); do perl -p -e "s/annotate_env/${a}_env/g; s/veba-annotate/veba-$a/g" 1.0.0-annotate > 1.0.0-$a; done
```
