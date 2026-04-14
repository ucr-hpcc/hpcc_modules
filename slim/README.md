https://messerlab.org/slim/
https://github.com/MesserLab/SLiM

- Download SLiM.zip and SLiM_Recipes.zip . Extract.
- `mkdir build`
- `cd build`
- `mkdir /opt/linux/rocky/N.N/x86_64/pkgs/slim/N.N/bin` (necessary?)
- `cmake -DCMAKE_INSTALL_PREFIX=/opt/linux/rocky/N.N/x86_64/pkgs/slim/N.N/ ../SLiM/`
- `make`
- `make install`
- `cd ..`
- `mv -v SLiM_Recipes /opt/linux/rocky/N.N/x86_64/pkgs/slim/N.N/`
