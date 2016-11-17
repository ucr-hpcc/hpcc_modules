# SLURM
1 Install munge
2 Install bclr
3 Install OFED
4 Install dmtcp
# Install rpm dependencies
```
yum install -y json-devel pam-devel hdf5-devel gtk2-devel numactl-devel man2html hwloc json-*
```
# Configure SLURM
```
./configure \
--prefix=/opt/linux/centos/7.x/x86_64/pkgs/slurm/16.05.4 \
--with-mysql_config=/bin/ \
--enable-pam \
--enable-shared \
--disable-gtktest \
--enable-multiple-slurmd \
--enable-simulator \
--with-pam_dir=/usr/include/security \
--with-ofed=../MLNX_OFED_LINUX-2.4-1.0.4-rhel7.1-x86_64 \
--with-blcr=/opt/linux/centos/7.x/x86_64/pkgs/blcr/0.8.6_b4 \
--with-munge=/usr/local
```
# Build SLURM
```
make -j all
```
# Install SLURM
```
make install
```
# SPANK
http://slurm.schedmd.com/spank.html
This manual briefly describes the capabilities of the Slurm Plug-in architecture for Node and job Kontrol (SPANK) as well as the SPANK configuration file: (By default: plugstack.conf.)
SPANK provides a very generic interface for stackable plug-ins which may be used to dynamically modify the job launch code in Slurm. SPANK plugins may be built without access to Slurm source code. They need only be compiled against Slurm's spank.h header file, added to the SPANK config file plugstack.conf, and they will be loaded at runtime during the next job launch. Thus, the SPANK infrastructure provides administrators and other developers a low cost, low effort ability to dynamically modify the runtime behavior of Slurm job launch.
Note: SPANK plugins using the Slurm APIs need to be recompiled when upgrading Slurm to a new major release.
# Prep SPANK plugins
Modify \*.c files to contain proper location of X11_LIBEXEC_PROG
```
#define X11_LIBEXEC_PROG    /opt/linux/centos/7.x/x86_64/pkgs/slurm/16.05.4/libexec/slurm/slurm-spank-x11
```
# Build/Install SPANK plugins:
Build Binary
```
gcc -o slurm-spank-x11 slurm-spank-x11.c
cp slurm-spank-x11 /opt/linux/centos/7.x/x86_64/pkgs/slurm/16.05.4/libexec/slurm
```
Build shared library
```
gcc -fPIC -shared -I../../../ -o x11.so slurm-spank-x11.c slurm-spank-x11-plug.c
cp x11.so /opt/linux/centos/7.x/x86_64/pkgs/slurm/16.05.4/lib/slurm
```
Copy over config and uncomment x11.so line
```
cp plugstack.conf /opt/linux/centos/7.x/x86_64/pkgs/slurm/16.05.4/etc/
optional    x11.so
```
Not sure if it is neccessary, but I also reloaded the configs on all nodes
```
scontrol reconfigure
```
