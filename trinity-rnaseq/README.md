# trinity-rnaseq Notes

* New versions of Trinity seem to skip building ParaFly by default. To add ParaFly to a Trinity installation:

```bash
(as pkgadmin)
cd /opt/linux/centos/7.x/x86_64/pkgs/trinity-rnaseq/<VERSION>/trinity-plugins/
make parafly_target
```
