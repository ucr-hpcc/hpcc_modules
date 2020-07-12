https://github.com/KwanLab/Autometa

Note - this is still python2 tool

conda env installed in miniconda3 as autometa
databases installed in /srv/projects/db/autometa/1.0.1
see download.sh script in there reproduced here:
```
#!/usr/bin/bash
#SBATCH --time 12:00:00 -p batch --mem 96gb -n 48 -N 1

module load aspera
ascp -i $ASPERAKEY -QT -k 1 -l 500m anonftp@ftp.ncbi.nlm.nih.gov:/blast/db/FASTA/nr.gz.md5 .
ascp -i $ASPERAKEY -QT -k 1 -l 500m anonftp@ftp.ncbi.nlm.nih.gov:/blast/db/FASTA/nr.gz .
ascp -i $ASPERAKEY -QT -k 1 -l 500m anonftp@ftp.ncbi.nlm.nih.gov:pub/taxonomy/accession2taxid/prot.accession2taxid.gz.md5 .
ascp -i $ASPERAKEY -QT -k 1 -l 500m anonftp@ftp.ncbi.nlm.nih.gov:pub/taxonomy/accession2taxid/prot.accession2taxid.gz .
pigz -d prot.accession2taxid.gz
module load diamond/0.9.34
if [ nr.gz -nt nr.dmnd ]; then
	diamond makedb --in nr.gz --db ./nr -p 48
	md5sum nr.dmnd > nr.dmnd.md5
fi
```
