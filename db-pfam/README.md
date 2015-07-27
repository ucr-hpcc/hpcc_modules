# Install
Pfam-A is basically the main db, curated dbs, 
while Pfam-B is the automatically constructed unsupervised one.
I can't remember what is in Pfam-C but it is small and worth grabbing
I think.

Not sure why, but the latest version of Pfam does not have the Pfam-B files.

Please note that there already exists a script to install Pfam, located here:
> `/srv/projects/db/pfam/get_pfam.sh`

## Download
Latest location:
> [ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/](ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/)

### Files
1. Pfam-A.hmm.gz
2. Pfam-A.hmm.dat.gz
3. Pfam-B.hmm.gz
4. Pfam-B.hmm.dat.gz
5. Pfam-C.gz

## Unzip
```
gunzip Pfam-A.hmm.gz
gunzip Pfam-A.hmm.dat.gz 
gunzip Pfam-B.hmm.gz     
gunzip Pfam-B.hmm.dat.gz 
gunzip Pfam-C.gz         
```

## Post Process
You still have to run hmmpress (latest version) on the .hmm db
files once they are uncompressed which will produce the analagous index
files to the .ssi index files which were from hmmindex on HMMER-2 file
```
module load hmmer
hmmpress Pfam-A.hmm
hmmpress Pfam-B.hmm
```

