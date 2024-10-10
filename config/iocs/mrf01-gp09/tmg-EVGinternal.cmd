#############################################
## Event Clock setup (internal)            ##
#############################################

## Internal Event Clock (fractional synthesizer, MHz)
dbpf("$(PREFIX)-$(EVG):EvtClk-Source-Sel","FracSyn")
## Expected frequency
dbpf("$(PREFIX)-$(EVG):EvtClk-FracSynFreq-SP","62.08")

## Sequencer configuration
## Configure sequencer 1 to use time (EGU) to define TOE instead of clock cycles (TICKS)
dbpf("$(PREFIX)-$(EVG):SoftSeq-1-TsInpMode-Sel","EGU")
## define TOE resolution as microseconds (uSec), valid settings are: Sec, mSec, uSec and nSec
dbpf("$(PREFIX)-$(EVG):SoftSeq-1-TsResolution-Sel","uSec")

## Internal sequence trigger (Multiplexer 0, Hz)
dbpf("$(PREFIX)-$(EVG):Mxc0-Frequency-SP","100")
## Set internal trigger source
dbpf("$(PREFIX)-$(EVG):SoftSeq-1-TrigSrc-Sel","Mxc0")



