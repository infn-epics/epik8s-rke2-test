#!../../bin/linux-x86_64/mrf

## Register all support components
dbLoadDatabase("../../dbd/mrf.dbd")
mrf_registerRecordDeviceDriver(pdbbase)
epicsEnvSet("AUTOSAVE", "/mnt/iocdata/autosave/mtca01")


epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","10000000")

epicsEnvSet("AUTOSAVE", "mtca01-evr")
mrmEvrSetupPCI("EVR0","06:00.0","UNIV")
mrmEvrSetupPCI("EVR1","0e:00.0","UNIV")
mrmEvgSetupPCI("EVG","0c:00.0")

dbLoadRecords("../../db/evr-mtca-300u.uv.db","P=MRF01:evr:, EVR=EVR0")
dbLoadRecords("../../db/evr-mtca-300u.uv.db","P=MRF01:evr1:, EVR=EVR1")
dbLoadRecords("../../db/evm-mtca-300.uv.db","P=MRF01:evg:, EVG=EVG")
dbLoadRecords("../../db/evm-mtca-300-evr.uv.db","P=MRF01:evg:,T=U, EVG=EVG")
# dbLoadRecords("../../db/evm-mtca-300-evr.uv.db","P=MRF01:evg:,T=D, EVG=EVG")

# save_restoreDebug(2)
dbLoadRecords("../../db/save_restoreStatus.db", "P=MRF01-AS:")
save_restoreSet_status_prefix("MRF01-AS:")

set_savefile_path("${AUTOSAVE}")
set_requestfile_path("${AUTOSAVE}")

set_pass0_restoreFile("mrf_settings.sav")
set_pass0_restoreFile("mrf_values.sav")
set_pass1_restoreFile("mrf_values.sav")
set_pass1_restoreFile("mrf_waveforms.sav")
# disable use of current time until validation is implemented
var(mrmGTIFEnable, 0)

iocInit()

# makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_settings.req", "autosaveFields_pass0")
# makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_values.req", "autosaveFields")
# makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_waveforms.req", "autosaveFields_pass1")

# create_monitor_set("mrf_settings.req", 5 , "")
# create_monitor_set("mrf_values.req", 5 , "")
# create_monitor_set("mrf_waveforms.req", 30 , "")

dbl > pvlist.txt
# end
