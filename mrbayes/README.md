# Install
Since we support multiple configurations you will need to compile MrBayes 4 times:
  1. Compile mb binary on avx2 enabled CPU (intel partition) then add _avx to executable name
  
  ```bash
  srun -p short -c 4 --pty bash -l
  cd /opt/linux/centos/7.x/x86_64/src/mrbayes/MrBayes-3.2.7a
  ./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a && make && make install
  mv /opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a/mb /opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a/mb_avx
  ```
  
  2. Compile mb binary on avx2 enabled CPU (intel partition) and use --with-mpi flag then add _avx_mpi to executable name
  
  ```
  srun -p short -c 4 --pty bash -l
  cd /opt/linux/centos/7.x/x86_64/src/mrbayes/MrBayes-3.2.7a
  ./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a --with-mpi && make && make install
  mv /opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a/mb /opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a/mb_avx_mpi
  ```
  
  3. Compile mb binary on non avx2 enabled CPU (batch partition) and use --with-mpi flag then add _mpi to executable name
  
  ```
  srun -p batch --time=2:00:00 -c 4 --pty bash -l
  cd /opt/linux/centos/7.x/x86_64/src/mrbayes/MrBayes-3.2.7a
  ./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a --with-mpi && make && make install
  mv /opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a/mb /opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a/mb_mpi
  ```
  
  4. Compile mb binary on non-avx2 enabled CPU (batch partition) and keep the name as is.
  
  ```
  srun -p batch --time=2:00:00 -c 4 --pty bash -l
  cd /opt/linux/centos/7.x/x86_64/src/mrbayes/MrBayes-3.2.7a
  ./configure --prefix=/opt/linux/centos/7.x/x86_64/pkgs/mrbayes/3.2.7a && make && make install
  ```
