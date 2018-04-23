Notes on installing bioBakery workflows
Please update as needed

# Install

- Prepare Python virtualenv:
```bash
module unload python
module load python/2.7.13-venv
cd /opt/linux/centos/7.x/x86_64/pkgs/python/2.7.13-venv
virtualenv --system-site-packages biobakery_workflows-0.9.0
```

- Activate the biobakery_workflows venv:
```bash
module unload python
source /opt/linux/centos/7.x/x86_64/pkgs/python/2.7.13-venv/biobakery_workflows-0.9.0/bin/activate
```

- Install biobakery_workflows and dependencies
```bash
pip install biobakery_workflows kneaddata humann2 numpy scipy matplotlib
```
