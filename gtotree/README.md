Install gtotree from bioconda
https://anaconda.org/bioconda/gtotree
https://github.com/AstrobioMike/GToTree/wiki/what-is-gtotree%3F
https://github.com/AstrobioMike/GToTree

Because GTT seems to write to the environment when updating the Assembly summaries, it might be better to have users create their own environments rather than have it as a module:
```bash
conda create -n gtt_env
conda activate gtt_env
mamba install -c conda-forge -c bioconda gtotree
conda activate gtt_env  # Yes, activate it again. Will set various "*_dir" environment variables
# Can run `gtt-data-locations check` to see where data will be saved and `gtt-data-locations set` to change them
gtt-get-ncbi-assembly-tables # Download the assembly summaries
```
