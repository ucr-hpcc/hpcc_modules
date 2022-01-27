# hicexplorer

Seems as though there are some conflicts and conda is stuck in a dependency loop.

## Create conda environment file

Go [here](https://hicexplorer.readthedocs.io/en/latest/content/installation.html#requirements) and copy and paste the requirements into a `yml` file.

Ensure correct format is used as defined [here](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-file-manually).

## Install from conda environment file

First comment out `python-graphviz` from the `yml` file.
Then install like so:

```bash
conda env create -f hicexplorer.yml
```

After that you can install `python-graphviz` like so:

```bash
conda activate 

# Do not update deps, could break things?
#conda install 'python-graphviz>=0.14' -c conda-forge --no-deps

# Update deps, probably OK?
conda install 'python-graphviz>=0.14' -c conda-forge
```

