#!/bin/bash
mount -o remount ,rw /
ntpdate ntp1.lnf.infn.it
./st.cmd
