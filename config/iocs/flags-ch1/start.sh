#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
pip install -r requirements.txt
echo "Starting __IOC_NAME__: $EPICS_CA_ADDR_LIST"
python ./scripts/pymotflag.py sparc-config.yaml
echo "Exited..."
