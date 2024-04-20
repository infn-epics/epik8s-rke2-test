#!../../bin/linux-x86_64/mrf

## Register all support components
dbLoadDatabase("../../dbd/mrf.dbd")
mrf_registerRecordDeviceDriver(pdbbase)
epicsEnvSet("AUTOSAVE", "/mnt/iocdata/autosave/mtca01")


epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","10000000")

epicsEnvSet("AUTOSAVE", "/mnt/iocdata/autosave/mtca01-evr")
mrmEvrSetupPCI("EVR0","06:00.0","UNIV")
mrmEvrSetupPCI("EVR1","0e:00.0","UNIV")
mrmEvgSetupPCI("EVG","0c:00.0")

dbLoadRecords("../../db/evr-mtca-300u.uv.db","P=__IOC_PREFIX__:evr:, EVR=EVR0")
dbLoadRecords("../../db/evr-mtca-300u.uv.db","P=__IOC_PREFIX__:evr1:, EVR=EVR1")
dbLoadRecords("../../db/evm-mtca-300.uv.db","P=__IOC_PREFIX__:evg:, EVG=EVG")

iocInit()


dbl
dbl > pvlist.txt
# end
