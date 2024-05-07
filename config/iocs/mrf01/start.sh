#!/bin/sh
echo "iocname:$__IOC_PREFIX__" 
modprobe mrf

if [ -n "$__IOC_PREFIX__" ];then
    echo "$__IOC_PREFIX__ patching "
    sed  -i s/__IOC_PREFIX__/$__IOC_PREFIX__/ *.substitutions *.cmd envPaths *.db
else
    echo "%%Warning no __IOC_PREFIX__ defined"
fi
./st.cmd
