#!/bin/sh
echo "iocname:$__IOC_PREFIX__" 
if [ -n "$__IOC_PREFIX__" ];then
    echo "$__IOC_PREFIX__ patching redpitaya.substitutions"
    sed  -i s/__IOC_PREFIX__/$__IOC_PREFIX__/ *.substitutions *.cmd
else
    echo "%%Warning no __IOC_PREFIX__ defined"
fi
./st.cmd
