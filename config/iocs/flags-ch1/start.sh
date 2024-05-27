#!/bin/bash
script_dir=$(dirname "$0")
cd $script_dir
pip install -r scripts/requirements.txt
echo "Starting __IOC_NAME__"
python ./scripts/pymotflag.py sparc-config.yaml
echo "Exited..."
