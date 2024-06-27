# Matlab

1. Submit a Software Request ticket to ITS for Matlab. Should get a "license.lic" file.
2. Will need to install, on the `matlab` license server, the matlab license manager
    a. https://www.mathworks.com/help/install/ug/install-license-manager-on-license-server.html
    b. Will need to use X11 forwarding as all of matlab is graphical
4. On the server, install matlab as a client\
    a. https://www.mathworks.com/help/install/ug/install-products-on-client-machines.html
    b. When installed correctly, users **should not** need to log in with a mathworks account.


#OLD INFO

---

## License

### File

As for the License file, you will just need to concatenate the `Parallel 
Server` License File with the concurrent MATLAB License File.
Since they are different license numbers you will have to download them each separately.
Also ensure that the header of the license file is manually added after concatination.
The header should contain the following:

```
SERVER matlab 46029C6A8080 27000
DAEMON MLM "/usr/local/MATLAB/R2020a/etc/MLM"
```

### Server

When installing the software ensure that you update the License server first.

## Install

For any new versions of MATLAB, just make sure that you are using the License 
 number or File Installation Key for `Parallel Server` specifically.

In order to install offline, you need to download the latest ISO file.
Download this and mount it under a local disk on a compute node.
Navigate to mounted location as `pkgadmin` and run the installer.

## Toolbox

For the installation on the current R2018b version, you can run the installer 
and add `Parallel Server` just like you would for any other additional Toolbox.

