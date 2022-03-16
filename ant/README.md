# Ant

## Download

Downloading is easy:

```bash
wget https://downloads.apache.org/ant/binaries/apache-ant-1.10.12-bin.tar.bz2
```

See https://ant.apache.org/bindownload.cgi for more version links.

## Install

Basically just extact it and then run ant:

```bash
tar -xf apache-ant-1.10.12-bin.tar.bz2
```

## Troubleshoot

If you see an error regarding `target` or `source` versions, try a newer version of `Java` or modify the `build.xml`:

```xml
    <property name="target" value="1.7"/>
    <property name="source" value="1.7"/>
```

