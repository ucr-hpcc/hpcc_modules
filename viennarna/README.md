# ViennaRNA

## Download and Prep

Download relaese from:

```bash
wget https://github.com/ViennaRNA/ViennaRNA/releases/download/v2.4.17/ViennaRNA-2.4.17.tar.gz
```

Extract:

```bash
tar -xf ViennaRNA-2.4.17.tar.gz
cd ViennaRNA-2.4.17
```

## Install

Load deps:

```bash
module load texlive
module load pandoc
```

Clean:

```bash
make distclean || echo "Already clean"
```

Configure:

```bash
./configure --prefix=$HPCC_MODULES/viennarna/2.4.17
```

Build:

```bash
make
```

Install

```bash
make install
```

> Note if .pdf fails, it could be caused by missing or failing pdflatex

