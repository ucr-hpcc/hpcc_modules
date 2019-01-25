# Diamond

## Installation
```bash
wget http://github.com/bbuchfink/diamond/releases/download/v0.9.22/diamond-linux64.tar.gz
tar xzf diamond-linux64.tar.gz
```

Copy extracted binary to the pkgs directory

```bash
cp /opt/linux/centos/7.x/x86_64/src/diamond-0.9.22/diamond /opt/linux/centos/7.x/x86_64/pkgs/diamond/0.9.22/.
cp /opt/linux/centos/7.x/x86_64/src/diamond-0.9.22/diamond_manual.pdf /opt/linux/centos/7.x/x86_64/pkgs/diamond/0.9.22/.
```

## Database

Download nr raw data (takes about an hour):

```
nohup wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/nr.gz &
tail -f nohup.out
```

Set up a reference database for DIAMOND

```bash
diamond makedb --in nr.faa -d nr
```

This will create a binary DIAMOND database file with the specified name (nr.dmnd).

## Usage

The alignment task may then be initiated using the blastx command like this:

```bash
diamond blastx -d nr -q reads.fna -o matches.m8
```

