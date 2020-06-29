# Installing Software
This is mainly the basic "configure, make, make install". However we do support all kinds of packaged software, so this is not always the case.
For specific installation details please refer to the documentation prodvided by the software as well as the individual README.md files contained within the installed module, assuming that the softwere had been insatlled previously.

However you can look at the openbabel module and see the example README.md:
[Openbabel](openbabel "openbabel")

## Installs
1. Make sure you have a checkout of the hpcc_modules repository
2. Login as ```pkgadmin```
3. Move to the ```/opt/linux/centos/7.x/x86_64/src``` directory
4. Download and extract the source files in ```/opt/linux/centos/7.x/x86_64/src```
5. Create a directory named ```/opt/linux/centos/7.x/x86_64/pkgs/[name of module]/[module version]```
6. If precompiled, move the binaries to the directory created in step 5
7. Log out of ```pkgadmin```
8. Move to your local hpcc_modules directory
9. Copy any one of the existing directories into a new directory with the same name as the module being installed
10. Go into the newly created directory
11. Edit the ```.version``` file so that it contains the correct ModuleVersion number
12. Rename the ```[module version]``` file with the version number of the newly installed module
13. Edit the file from step 12 so that it contains the correct module name, version and paths
14. ```git add``` both files, ```git commit``` the changes then ```git push```
15. After this you can test the installtion by trying ```module load [name of module]``` and ```module avail [name of module]```

## Modules
These are the modules that are currently available on the UCR HPC cluster

Module files now use environment variables to determine the path:

  * HPCC_MODULES - Path dynamically built by /etc/profile.d/modules.sh at login to specify install path of modules.
  * MODULESHOME - Path set by module system to specify home of module system.

## Standards
1. Symlinks can be used in order to catch alternative spellings of the same package
2. Keep names of packages to all lowercase when possible
3. Spaces are not allowed, underscores should be used in place of spaces for software module names
4. Software that requires a common write location or uniqe config file should use environment variables to define these location[s]/config[s] which are set within the module
