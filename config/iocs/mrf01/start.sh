#!/bin/sh
echo "iocname:$__IOC_PREFIX__"
echo "* removing pci and mrf linux drivers"
rmmod pci_mrfevg
rmmod pci_mrfevr
rmmod mrf
echo "* readding pci and mrf linux drivers"

modprobe pci_mrfevg
modprobe pci_mrfevr
sleep 1
modprobe mrf
echo "* starting ioc"

if [ -n "$__IOC_PREFIX__" ];then
    echo "$__IOC_PREFIX__ patching "
    sed  -i s/__IOC_PREFIX__/$__IOC_PREFIX__/ *.substitutions *.cmd envPaths *.db
else
    echo "%%Warning no __IOC_PREFIX__ defined"
fi
./st.cmd
