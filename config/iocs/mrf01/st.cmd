#!../../bin/linux-x86_64/mrf

## Register all support components
dbLoadDatabase("../../dbd/mrf.dbd")
mrf_registerRecordDeviceDriver(pdbbase)
epicsEnvSet("AUTOSAVE", "/mnt/autosave/mtca01")


epicsEnvSet("EPICS_CA_MAX_ARRAY_BYTES","10000000")

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

makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_settings.req", "autosaveFields_pass0")
makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_values.req", "autosaveFields")
makeAutosaveFileFromDbInfo("${AUTOSAVE}/mrf_waveforms.req", "autosaveFields_pass1")

create_monitor_set("mrf_settings.req", 5 , "")
create_monitor_set("mrf_values.req", 5 , "")
create_monitor_set("mrf_waveforms.req", 30 , "")

dbl("*") > __CONFIG_DIR__/pvlist.txt
## initializations


    dbpf("MRF01:evg:EvtClkRFFreq-SP", "714 MHz")
    dbpf("MRF01:evg:EvtClkRFDiv-SP", "9")
    dbpf("MRF01:evg:EvtClkFracSynFreq-SP", "79.333 MHz")
    dbpf("MRF01:evg:EvtClkSource-Sel", "RF")
    dbpf("MRF01:evg:Mxc0Prescaler-SP", "79333000")
    dbpf("MRF01:evg:Mxc7Prescaler-SP", "79333")
    dbpf("MRF01:evg:TrigEvt0EvtCode-SP", "1")
    dbpf("MRF01:evg:TrigEvt1EvtCode-SP", "2")
    dbpf("MRF01:evg:TrigEvt2EvtCode-SP", "3")
    dbpf("MRF01:evg:AcTrigDivider-SP", "5")
    dbpf("MRF01:evg:AcTrigPhase-SP", "0 msec")
    dbpf("MRF01:evg:AcTrigBypass-Sel", "Off")
    dbpf("MRF01:evg:AcTrigSyncSrc-Sel", "Mxc7")
    dbpf("MRF01:evr:LinkClk-SP", "79.333 MHz")
    dbpf("MRF01:evr:DlyGen0Width-SP", "1 us")
    dbpf("MRF01:evr:DlyGen0EvtTrig0-SP", "1")
    dbpf("MRF01:evr:DlyGen1Delay-SP", "50000 us")
    dbpf("MRF01:evr:DlyGen1Width-SP", "1 us")
    dbpf("MRF01:evr:DlyGen1EvtTrig0-SP", "3")
    dbpf("MRF01:evr1:LinkClk-SP", "79.333 MHz")
    dbpf("MRF01:evr1:DlyGen0Width-SP", "1 us")
    dbpf("MRF01:evr1:DlyGen1Width-SP", "3 us")
    dbpf("MRF01:evr1:DlyGen0EvtTrig0-SP", "17")
    dbpf("MRF01:evr1:DlyGen1EvtTrig0-SP", "2")
    dbpf("MRF01:evr1:In1Lvl-Sel", "Active High")
    dbpf("MRF01:evr1:In0Edge-Sel", "Active Rising")
    dbpf("MRF01:evr1:In0TrigExt-Sel", "Edge")
    dbpf("MRF01:evr1:In0CodeExt-SP", "17")
# end
