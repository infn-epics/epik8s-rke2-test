#!/bin/sh
name=`hostname`
echo "Starting CA Gateway $EPICS_CA_ADDR_LIST on $EPICS_GATEWAY_ADDR_LIST ($name)"

/epics/ca-gateway/bin/linux-x86_64/gateway -cip "$EPICS_CA_ADDR_LIST" -pvlist /epics/ca-gateway/configure/pvlist -debug 10 -sip 0.0.0.0 -access /epics/ca-gateway/configure/gwaccess.access