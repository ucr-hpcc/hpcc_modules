Installed into conda env
https://github.com/nextgenusfs/funannotate2
```


mamba create -p /opt/linux/centos/8.x/x86_64/pkg/funannotate2/2.0.0alpha "python<=3.10" biopython "evidencemodeler>=2" minimap2 miniprot snap "augustus==3.5.0" glimmerhmm diamond blast

conda activate funannotate2
python -m pip install git+https://github.com/nextgenusfs/funannotate2.git --upgrade --force --no-deps


