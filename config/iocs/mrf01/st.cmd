#!../../bin/linux-x86_64/mrf

## Register all support components
dbLoadDatabase("../../dbd/mrf.dbd")
mrf_registerRecordDeviceDriver(pdbbase)
epicsEnvSet("AUTOSAVE", "/mnt/iocdata/autosave/mtca01")


epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","10000000")

epicsEnvSet("AUTOSAVE", "/mnt/iocdata/autosave/mtca01-evr")
mrmEvrSetupPCI("EVR0","06:00.0")
mrmEvrSetupPCI("EVR1","0e:00.0")
mrmEvgSetupPCI("EVG","0c:00.0")

# dbLoadRecords("../../db/evr-mtca-300u.uv.db","P=__IOC_PREFIX__:evr:, EVR=EVR0")
# dbLoadRecords("../../db/evr-mtca-300u.uv.db","P=__IOC_PREFIX__:evr1:, EVR=EVR1")
dbLoadRecords("../../db/evr-mtca-300u.db","P=__IOC_PREFIX__:,ES=evr:, EVR=EVR0")
dbLoadRecords("../../db/evr-mtca-300u.db","P=__IOC_PREFIX__,ES=:evr1:, EVR=EVR1")

dbLoadRecords("../../db/evm-mtca-300.uv.db","P=__IOC_PREFIX__:evg:, EVG=EVG")
# save_restoreDebug(2)
# dbLoadRecords("../../db/save_restoreStatus.db", "P=__IOC_PREFIX__-AS:")
#save_restoreSet_status_prefix("__IOC_PREFIX__-AS:")

set_savefile_path("${AUTOSAVE}")
# set_requestfile_path("${AUTOSAVE}")

# set_pass0_restoreFile("mrf_settings.sav")
# set_pass0_restoreFile("mrf_values.sav")
# set_pass1_restoreFile("mrf_values.sav")
# set_pass1_restoreFile("mrf_waveforms.sav")
# disable use of current time until validation is implemented
# var(mrmGTIFEnable, 0)

iocInit()

# makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_settings.req", "autosaveFields_pass0")
# makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_values.req", "autosaveFields")
# makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_waveforms.req", "autosaveFields_pass1")

# create_monitor_set("mrf_settings.req", 5 , "")
# create_monitor_set("mrf_values.req", 5 , "")
# create_monitor_set("mrf_waveforms.req", 30 , "")

dbl
dbl > pvlist.txt
# end
