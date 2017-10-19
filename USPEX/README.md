# USPEX 9.4.4 Install Notes

1) Create the install folder (e.g `/opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4/`)

2) Load Octave (Matlab is also supported, but not everyone has access to it)

`module load octave`

3) Run install.sh

4) Set PATH and USPEXPATH appropriately

## Notes from last install:

```
1) You can edit the file to change the install path of MATLAB or Octave:

   /opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4/CODEPATH

2) Please Set the Shell Environment Variables to enable USPEX code!

   For Bash shell system, add these lines to ~/.bashrc or ~/.profile or /etc/profile:
     export PATH=/opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4:$PATH
     export USPEXPATH=/opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4/src

   For C shell system, add these lines to ~/.cshrc or ~/.profile or /etc/profile:
     setenv PATH "/opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4:$PATH"
     setenv USPEXPATH "/opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4/src"

3) For tests running, please go to the tests folder and run the following command for more details:

   python /opt/linux/centos/7.x/x86_64/pkgs/USPEX/9.4.4/tests/USPEX_test.py -h
```
