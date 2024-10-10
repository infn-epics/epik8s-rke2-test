#############################################
## EVR setup                               ##
#############################################

## EVR output. Initialize delay, width and polarity

dbpf("$(PREFIX)-$(EVR):Pul0-Width-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul0-Delay-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul0-Polarity-Sel","0")
dbpf("$(PREFIX)-$(EVR):Pul0-Ena-Sel","1")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut0-Src-Pulse-SP","Pulser 0")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut0-Ena-SP","1")

dbpf("$(PREFIX)-$(EVR):Pul1-Width-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul1-Delay-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul1-Polarity-Sel","0")
dbpf("$(PREFIX)-$(EVR):Pul1-Ena-Sel","1")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut1-Src-Pulse-SP","Pulser 1")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut1-Ena-SP","1")

dbpf("$(PREFIX)-$(EVR):Pul2-Width-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul2-Delay-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul2-Polarity-Sel","0")
dbpf("$(PREFIX)-$(EVR):Pul2-Ena-Sel","1")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut2-Src-Pulse-SP","Pulser 2")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut2-Ena-SP","1")

dbpf("$(PREFIX)-$(EVR):Pul3-Width-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul3-Delay-SP","0")
dbpf("$(PREFIX)-$(EVR):Pul3-Polarity-Sel","0")
dbpf("$(PREFIX)-$(EVR):Pul3-Ena-Sel","1")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut3-Src-Pulse-SP","Pulser 3")
dbpf("$(PREFIX)-$(EVR):FrontUnivOut3-Ena-SP","1")


## Enable EVRs and lock to Event clock

dbpf("$(PREFIX)-$(EVR):Link-Clk-SP","62.08")
dbpf("$(PREFIX)-$(EVR):Ena-Sel","Enabled")
