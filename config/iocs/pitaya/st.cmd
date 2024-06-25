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

dbpf("__IOC_PREFIX__:RESET_ACQ_CMD","1")
dbpf("__IOC_PREFIX__:ACQ_TRIGGER_SRC_CMD","__ACQ_TRIGGER_SRC_CMD__")
dbpf("__IOC_PREFIX__:ACQ_SAMPL_RATE_CMD","125 MHz")
dbpf("__IOC_PREFIX__:ACQ_AVERAGING_CMD","Off")
dbpf("__IOC_PREFIX__:IN2_GAIN_CMD","High")
dbpf("__IOC_PREFIX__:OUT1_FREQ_SP","0")
dbpf("__IOC_PREFIX__:OUT2_FREQ_SP","0")
dbpf("__IOC_PREFIX__:OUT1_FREQ_SP","0")
dbpf("__IOC_PREFIX__:OUT2_FREQ_SP","0")
dbpf("__IOC_PREFIX__:OUT1_ENABLE_CMD","1")
dbpf("__IOC_PREFIX__:OUT2_ENABLE_CMD","1")
dbpf("__IOC_PREFIX__:OUT1_ENABLE_CMD","1")
dbpf("__IOC_PREFIX__:OUT2_ENABLE_CMD","1")
dbl("*") > __CONFIG_DIR__/pvlist.txt

# end
