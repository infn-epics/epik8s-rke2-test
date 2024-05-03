#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
echo "Starting Orbit addr: $EPICS_CA_ADDR_LIST"
python ./scripts/py-ioc-collector.py -c sparc_orbit.json
echo "Exited..."
