#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
pip install -r scripts/requirements.txt
echo "Starting __IOC_NAME__"
python ./scripts/pymotflag.py sparc-config.yaml -p __CONFIG_DIR__/pvlist.txt
echo "Exited..."
