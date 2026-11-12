Foldseek (https://github.com/steineggerlab/foldseek), release 10-941cd33.

Installed in /opt/linux/centos/8.x/x86_64/pkgs/foldseek/

- 10-941cd33     CPU build
- 10-941cd33-gpu GPU build. Run it on a GPU node (e.g. `srun -p gpu --gres=gpu:1`).

The GPU binary shows no CUDA library dependencies in `ldd`, so the module does not load a cuda module.
