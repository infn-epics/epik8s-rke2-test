#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
echo "Starting $__IOC_NAME__ : $EPICS_CA_ADDR_LIST"
python ./scripts/mem2epics.py -i __IOC_PREFIX__ -c __CONFIGURATION__ -p __CONFIG_DIR__/pvlist.txt -ms __MEMECACHED_SERVER__
