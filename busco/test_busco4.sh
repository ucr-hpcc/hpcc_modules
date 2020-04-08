#!/usr/bin/bash
#SBATCH -p short -N 1 -n 24 --mem 16gb 

CPU=${SLURM_CPUS_ON_NODE}

if [ ! $CPU ]; then
     CPU=2
fi
module load busco/4.0.5

GENOME=Pseudomonas_fluorescens_NCTC10038.fasta
BUSCOFOLDER=/srv/projects/db/BUSCO/v10/lineages
LINEAGE=gammaproteobacteria_odb10
NAME=$(basename $GENOME .fasta)

OUTFOLDER=TMP_$$
mkdir -p $OUTFOLDER
pushd $OUTFOLDER
if [ ! -s $GENOME ]; then
    curl -o $GENOME.gz https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/900/475/215/GCF_900475215.1_42727_B01/GCF_900475215.1_42727_B01_genomic.fna.gz
    pigz -d $GENOME.gz
fi


busco --in $GENOME -o $NAME -l $BUSCOFOLDER/$LINEAGE -m geno \
     --cpu $CPU --offline --out_path ./

# Fungus
GENOME=Aspergillus_fumigatus_Af293.fasta
BUSCOFOLDER=/srv/projects/db/BUSCO/v10/lineages
LINEAGE=fungi_odb10
NAME=$(basename $GENOME .fasta)

if [ ! -s $GENOME ]; then
    curl -o $GENOME.gz https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/002/655/GCF_000002655.1_ASM265v1/GCF_000002655.1_ASM265v1_genomic.fna.gz
    pigz -d $GENOME.gz
fi

mkdir -p augustus
if [ -z $AUGUSTUS_CONFIG_PATH ]; then
    echo "No augustus install has been setup?"
    exit
fi
rsync -a $AUGUSTUS_CONFIG_PATH augustus
AUGUSTUS_CONFIG_PATH=$(realpath augustus/config)
busco --in $GENOME -o $NAME -l $BUSCOFOLDER/$LINEAGE -m geno \
     --cpu $CPU --offline --out_path ./


# could add auto-lineage testing too
# could add removal of --offline
# could add a test for --long with augustus retraining
