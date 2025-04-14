#############################################
## Event Clock setup                       ##
#############################################

## Event Clock, external (MHz)
dbpf("$(PREFIX)-$(EVG):EvtClk-Source-Sel","RF")
# Divider of Event Clock frequency
dbpf("$(PREFIX)-$(EVG):EvtClk-RFDiv-SP","1")
# Expected RF frequency
dbpf("$(PREFIX)-$(EVG):EvtClk-RFFreq-SP","62.08")

## Sequencer configuration
## Configure sequencer 1 to use time (EGU) to define TOE instead of clock cycles (TICKS)
dbpf("$(PREFIX)-$(EVG):SoftSeq-1-TsInpMode-Sel","EGU")
## define TOE resolution as microseconds (uSec), valid settings are: Sec, mSec, uSec and nSec
dbpf("$(PREFIX)-$(EVG):SoftSeq-1-TsResolution-Sel","uSec")

## External sequence trigger (AC mains on EVG TRIG input)
dbpf("$(PREFIX)-$(EVG):SoftSeq-1-TrigSrc-Sel","Front0")

## Sync the sequence trigger to 1/96 of the Event Clock frequency
dbpf("$(PREFIX)-$(EVG):Mxc7-Prescaler-SP","96")
dbpf("$(PREFIX)-$(EVG):AcTrig-SyncSrc-Sel","Mxc7")



