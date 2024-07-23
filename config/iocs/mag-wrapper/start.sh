#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
echo "Starting Mag-Wrapper : $EPICS_CA_ADDR_LIST"
pip install -r ./scripts/requirements.txt
python ./scripts/main.py -x SPARC -c sparc_linac_magnets.json
