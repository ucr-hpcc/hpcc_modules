https://github.com/lanl001/halc

installed from github clone a106f78 from May-2018, numbered this 1.2 release since there were earlier 1.1 release but were from 2016.
```
git clone https://github.com/lanl001/halc.git
cd halc
make
```

I installed a bash wrapper

```bash
#!/usr/bin/bash
module unload miniconda3
module load miniconda2

DIR=$(dirname `realpath $0`)
python $DIR/runHALC.py "$@"
````

As the regular running of the python script was failing and could not debug
--Jason Stajich 2019-08-29
