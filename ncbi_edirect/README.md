# NCBI Entrez Direct

[link](https://www.ncbi.nlm.nih.gov/books/NBK179288/)

## Install

This install script is mentioned on the web site:

```
ftp://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh
```

However it seems to be a very simple perl script, it just downloads the source code, extracts it, then runs the setup script in side. Instead of running this install script, it is best to just do the steps manually as described below.

Download source:

```bash
wget http://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz
```

Extract:

```bash
tar -xf wget edirect.tar.gz
```

Rename to `current`, since I could not find a reasonable version number:

```bash
mv edirect current
```

## Setup

If you run the setup script, it will download many data sets, not sure this is actually necessary:

```
${INSTALL_PATH}/ncbi_edirect/current/setup.sh
```
