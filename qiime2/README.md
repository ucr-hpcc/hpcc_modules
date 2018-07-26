# Install 
1. Download miniconda and install under opt
  ```
  wget https://repo.continuum.io/miniconda/Miniconda3-4.3.21-Linux-x86_64.sh
  chmod u+x Miniconda3-4.3.21-Linux-x86_64.sh
  ./Miniconda3-4.3.21-Linux-x86_64.sh -p /opt/linux/centos/7.x/x86_64/pkgs/miniconda3/4.3.21
  export PATH=/opt/linux/centos/7.x/x86_64/pkgs/miniconda3/4.3.21/bin:$PATH
  ```

2. Install qiime under separate conda environment
  ```
  conda create -n qiime2-2017.8 --file https://data.qiime2.org/distro/core/qiime2-2017.8-conda-linux-64.txt
  ```
For more info: https://docs.qiime2.org/2017.8/install/native/

3. Active environment
  ```
  source activate qiime2-2017.8
  ```

4. Test
  ```
  export LC_ALL=en_US.utf-8
  export LANG=en_US.utf-8
  qiime --help
  ```

5. Make a module
g
