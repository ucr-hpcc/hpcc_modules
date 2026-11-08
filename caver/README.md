Claude build a wrapper script for running the java
installed in -/opt/linux/rocky/8.x/x86_64/pkgs/caver/3.03b/bin/caver

```
#!/bin/bash
# CAVER 3.03b wrapper for UCR HPCC.
# Usage: caver -pdb <dir_of_pdbs> -conf <config.txt> -out <outdir>
# Adds -home and -cp so the user does not need to know the install path.
# Java heap: set CAVER_MEM (e.g. 8g). Default: SLURM memory minus 1 GB, else 4g.
# Extra JVM flags: CAVER_JAVA_OPTS.

CAVER_HOME="${CAVER_HOME:-/opt/linux/rocky/8.x/x86_64/pkgs/caver/3.03b/caver}"
CAVER_JAR="${CAVER_JAR:-${CAVER_HOME}/caver.jar}"

if [[ $# -eq 0 || "$1" == "-h" || "$1" == "--help" ]]; then
    cat <<USAGE
caver -pdb <pdb_dir> -conf <config.txt> -out <out_dir>

  -pdb   directory with input PDB files (one file per snapshot)
  -conf  CAVER config file (template: \$CAVER_CONFIG_TEMPLATE)
  -out   output directory

Environment:
  CAVER_MEM        Java max heap, e.g. 8g (default: from SLURM allocation, else 4g)
  CAVER_JAVA_OPTS  extra JVM options
Examples:  \$CAVER_EXAMPLES
USAGE
    exit 0
fi

if [[ -z "${CAVER_MEM:-}" ]]; then
    if [[ -n "${SLURM_MEM_PER_NODE:-}" ]]; then
        # SLURM_MEM_PER_NODE is in MB; leave 1 GB for JVM overhead
        m=$(( SLURM_MEM_PER_NODE - 1024 )); (( m < 1024 )) && m=1024
        CAVER_MEM="${m}m"
    else
        CAVER_MEM="4g"
    fi
fi

exec java -Xmx${CAVER_MEM} ${CAVER_JAVA_OPTS} -cp "${CAVER_HOME}/lib" \
    -jar "${CAVER_JAR}" -home "${CAVER_HOME}" "$@"
```
