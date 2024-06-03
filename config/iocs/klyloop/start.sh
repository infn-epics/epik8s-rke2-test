#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
echo "Starting $__IOC_NAME__ : $EPICS_CA_ADDR_LIST"
python ./scripts/klyLoopIOC.py -c klyloop.json