# FastQC

## Download

Downloading is easy:

```bash
wget https://github.com/s-andrews/FastQC/archive/refs/tags/v0.11.9.tar.gz
```

See https://github.com/s-andrews/FastQC/releases for more version links.

## Install

Basically just extact it and then run ant:

```bash
tar -xf v0.11.9.tar.gz
cd FastQC-0.11.9
module load ant
ant
```

## Troubleshoot

If you see an error regarding `target` or `source` versions, try an older version of `Java` or modify the `build.xml`:

```xml
    <property name="target" value="1.7"/>
    <property name="source" value="1.7"/>
```

