#!/root/redpitaya-ioc/bin/linux-arm/RedPitayaTest

< envPaths
epicsEnvSet currdir ${PWD}
cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/RedPitayaTest.dbd",0,0)
RedPitayaTest_registerRecordDeviceDriver(pdbbase) 

RedPitaya_Initialise (4)

# RedPitaya_Configure (portName, triggerPollingInterval in seconds)
RedPitaya_Configure ("RP", 0.1)
## Load record instances
dbLoadTemplate("${currdir}/redpitaya.substitutions")

iocInit()

dbpf("RESET_ACQ_CMD","1")
dbpf("ACQ_TRIGGER_SRC_CMD","EXT_PE")
dbpf("ACQ_SAMPL_RATE_CMD","125 MHz")
dbpf("ACQ_AVERAGING_CMD","Off")
dbpf("IN2_GAIN_CMD","High")
dbpf("OUT1_FREQ_SP","0")
dbpf("OUT2_FREQ_SP","0")
dbpf("OUT1_FREQ_SP","0")
dbpf("OUT2_FREQ_SP","0")
dbpf("OUT1_ENABLE_CMD","1")
dbpf("OUT2_ENABLE_CMD","1")
dbpf("OUT1_ENABLE_CMD","1")
dbpf("OUT2_ENABLE_CMD","1")
dbl("*") > __CONFIG_DIR__/pvlist.txt

# end
