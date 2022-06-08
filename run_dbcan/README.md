https://github.com/linnabrown/run_dbcan

need to run with --db $CAZY_FOLDER

```
module load run_dbcan
module load db-cazy
run_dbcan.py EscheriaColiK12MG1655.faa protein --out_dir output_EscheriaColiK12MG1655 --db_dir /srv/projects/db/CAZY/CAZyDB/v10.0
```

I modified the run_dbcan.py to hardcode to `/srv/projects/db/CAZY/CAZyDB/v10.0` by default for the db but would need to be fixed in any upgrade
