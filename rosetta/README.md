# Rosetta

## Prep
Download requires license (free for academics)
https://www.rosettacommons.org/demos/latest/tutorials/install_build/install_build


## Install
The tar comes with the static versions of the applications in binary form.
Just unpack the files into the correct direcotry.

```bash
tar -zxvf rosetta_bin_linux_3.9_bundle.tgz
mv rosetta_bin_linux_2018.09.60072_bundle 2018.09.60072
```

## Compile MPI Versions
The tar does not come with MPI Versions of the package them must be compiled.
Recommened to do this in a 6+ core interactive session.

```bash
srun -p short -c 6 --pty bash -l
cd /opt/linux/centos/7.x/x86_64/pkgs/rosetta/2018.09.60072/main/source/
./scons.py -j 6 mode=release bin extras=mpi
```
