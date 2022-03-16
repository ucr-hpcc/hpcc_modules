download from https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz
version determined from 
https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/reldate.txt

```
gunzip uniprot_sprot.fasta.gz
module load diamond/2.0.8
module load ncbi-blast/2.9.0+
module load hmmer/3
diamond makedb --in  uniprot_sprot.fasta -p 64 --db uniprot_sprot.dmnd
makeblastdb -parse_seqids -title swissprot-2021_01 -input_type fasta -dbtype prot -in uniprot_sprot.fasta
esl-sfetch --index uniprot_sprot.fasta
```
