## Install GATK

### Download and install

These files can come as binaries so we don't have to compile.

```bash
wget https://github.com/broadinstitute/gatk/releases/download/4.4.0.0/gatk-4.4.0.0.zip

unzip gatk-4.4.0.0.zip

mv gatk-4.4.0.0 /opt/linux/centos/8.x/x86_64/pkgs/gatk/4.4.0.0
```

fix the gatk script in the folder to have  this proper shebang (since python3 is enforced no python in path)
```
#!/usr/bin/env python3
```
