#!/bin/sh
name=`hostname`
echo "Starting CA Gateway $EPICS_CA_ADDR_LIST on $EPICS_GATEWAY_ADDR_LIST ($name)"
# -debug 1
echo "Starting caRepeater"

/epics/epics-base/bin/linux-x86_64/caRepeater&
sleep 1
defaults="-connect_timeout 30 -inactive_timeout 300 -dead_timeout 300 -disconnect_timeout 30 -reconnect_inhibit 300 -prefix gateway"
#options="-dead_timeout 10 -disconnect_timeout 5 -reconnect_inhibit 2 -connect_timeout 5 -prefix gateway"
options=$defaults
echo "Gateway options: $options"

/epics/ca-gateway/bin/linux-x86_64/gateway -cip "$EPICS_CA_ADDR_LIST" -pvlist /epics/ca-gateway/configure/pvlist $options -sip 0.0.0.0 -access /epics/ca-gateway/configure/gwaccess.access