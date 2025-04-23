#%Module1.0#####################################################################
##
## aiupred modulefile
##
proc ModulesHelp { } {
        global version prefix

        puts stderr "\taiupred - Adds aiupred tool to your path"
}

module-whatis	"aiupred-2.1"

set      hpcc_modules    $::env(HPCC_MODULES)

# Load miniconda
module load miniconda3

if { [module-info mode load] || [module-info mode switch2] } {
    puts stdout "module load miniconda3; conda config --set env_prompt '(\$(echo {default_env} |  perl -p -e \"s#.+pkgs/##;s/\/env//\")) '; conda activate --stack ${hpcc_modules}/aiupred/2.x/env;"
} elseif { [module-info mode remove] && ![module-info mode switch3] } {
    puts stdout "conda config --set env_prompt '({default_env}) '; conda deactivate;"
}

prepend-path	PATH	${hpcc_modules/aiupred/2.x/AIUPred

