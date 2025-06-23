https://github.com/gibsonlab/chronostrain

Installed with 
```
git clone https://github.com/gibsonlab/chronostrain.git ./chronostrain-0.6.0
cd chronostrain-0.6.0
mamba env create -f conda_full.yml -p /opt/linux/centos/8.x/x86_64/pkgs/chronostrain/0.6.0
```
# INFO

This runs a lot faster on GPU nodes.
GPU usage is enabled by default. To disable it, set JAX_PLATFORM_NAME=cpu in the environment variables.
