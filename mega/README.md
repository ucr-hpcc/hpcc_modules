# MEGA

Download the "Other Linux" Command Line, 64-bit version from [https://www.megasoftware.net/](https://www.megasoftware.net/)

Replace "11.0.13" with whatever version you're installing

```bash
VERSION="11.0.13"
tar xvf megacc_${VERSION}_amd64.tar.gz
mkdir -p $HPCC_MODULES/mega/${VERSION}/bin
mkdir -p $HPCC_MODULES/mega/${VERSION}/sing-bin # sing-bin is used for programs that are to-be-run from within the container
mkdir -p $HPCC_MODULES/mega/${VERSION}/share/man/man1
mv Examples/ $HPCC_MODULES/mega/${VERSION}/
mv megacc $HPCC_MODULES/mega/${VERSION}/sing-bin/
mv megacc.1 $HPCC_MODULES/mega/${VERSION}/share/man/man1
rm readme.txt usageAgreement.txt
```

At the time of writing, the glibc version required by MEGA is higher than what Rocky 8 provides, so a Rocky 9 Singularity container is used.

```bash
cd $HPCC_MODULES/mega/${VERSION}/bin
module load singularity
singularity pull docker://rockylinux:9
```

