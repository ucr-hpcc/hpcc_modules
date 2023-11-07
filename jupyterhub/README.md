Install conda requirements, specifying jupyterhub version `conda install -c conda-forge jupyterhub=4.0.2 jupyterlab notebook`

pkg_requirements.txt contain packages that should be `pip` installed in new environments, it provides libraries, like numpy,
that are commonly used. Can be expanded as/if software is requested.

`which pip` should return the pip from the environment.

`pip install -r pkg_requirements.txt`



The `PACKAGES` directory contains custom packages that jupyterhub required to function. They should be copied (and probably upgraded)
when installing new JupyterHub versions.

Read the 'README' in that directory for special considerations for each package.

`wrapspawner` handles the selection of profiles during login
	This has been modified locally. Pulled changes /could/ have merge conflicts.

`batchspawner` works with wrapspawner to launch the jupyter sessions on a compute node.


The `bin/` folder will also need to be copied. It contains a single script that aids users who accidentally load the jupyterhub module
instead of the jupyerlab module for starting a notebook.

