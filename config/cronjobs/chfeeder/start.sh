#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
pip install -r /app/requirements.txt
echo "Starting Channel Finder feeder, looking __CONFIG_DIR__ http://sparc-channelfinder.apps.okd-datest.lnf.infn.it/ChannelFinder epics epics"

python /app/cfeeder.py __CONFIG_DIR__ http://sparc-channelfinder.apps.okd-datest.lnf.infn.it/ChannelFinder epics epics
echo "Exited..."
