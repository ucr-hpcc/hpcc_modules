Install from https://github.com/LUMC/fastqsplitter
This tool is for fast splitting of fastq files

Install the bioconda package for 1.2.2 release but then upgrade to the latest from github
```
conda create -n fastqsplitter -c bioconda fastqsplitter
conda activate fastqsplitter
mkdir -p /opt/linux/centos/7.x/x86_64/src/fastqsplitter
cd /opt/linux/centos/7.x/x86_64/src/fastqsplitter
git clone https://github.com/LUMC/fastqsplitter fastqsplitter-git-dev
pip install .
```
