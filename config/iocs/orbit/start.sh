#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
echo "Starting Accumulator Orbit addr: $EPICS_CA_ADDR_LIST"
python ./scripts/py-ioc-collector.py -c sparc_orbit.json
