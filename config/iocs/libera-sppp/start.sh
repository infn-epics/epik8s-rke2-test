#!/bin/sh
if [ -n "$__IOC_PREFIX__" ];then
    echo "patching __IOC_PREFIX__ $__IOC_PREFIX__ "
    sed  -i s/__IOC_PREFIX__/$__IOC_PREFIX__/ *.substitutions *.cmd
else
    echo "%%Warning no __IOC_PREFIX__ defined"
fi

if [ -n "$__IOC_TOP__" ];then
    echo "patching __IOC_TOP__ $__IOC_TOP__ "
    sed  -i s/__IOC_TOP__/$__IOC_TOP__/ *.substitutions *.cmd
else
    echo "%%Warning no __IOC_TOP__ defined"
fi

if [ -n "$__IOC_NAME__" ];then
    echo "patching __IOC_NAME__ $__IOC_NAME__ "
    sed  -i s/__IOC_NAME__/$__IOC_NAME__/ *.substitutions *.cmd
else
    echo "%%Warning no __IOC_NAME__ defined"
fi

./st.cmd
