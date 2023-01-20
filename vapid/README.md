## Installed VAPiD from source [ [URL][https://github.com/rcs333/VAPiD/releases/tag/v1.3] ]

Installed Vapid virus db in /srv/db/vapid
Modified vapid3.py to use new table2asn command 

```sh
git clone https://github.com/rcs333/VAPiD.git
# Modify vapid3.py
cp vapid3.py $HPCC_MODULES/vapid/1.2/
cd $HPCC_MODULES/vapid/1.2/
# Create symlinks for db links
```

