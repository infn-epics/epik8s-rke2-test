#!../../bin/linux-x86_64/elinp-gp08-ioc06

#
# Project       : IOC software module
# Description   : IOC software module
# Authors       : Anze Jesenko <anze.jesenko@cosylab.com>
#
# Copyright (c) 2015 Cosylab d.d.
#

< envPaths
< envSystem
< envUser

cd "${TOP}"

#############################################
## Register all support components         ##
#############################################

dbLoadDatabase "dbd/elinp-gp08-ioc06.dbd"
elinp_gp08_ioc06_registerRecordDeviceDriver pdbbase



#############################################
## DB Loading                              ##
#############################################
#dbLoadTemplate("${TOP}/db/$(IOCMODULE).substitutions")


#############################################
## FCT setup                               ##
#############################################

epicsEnvSet("PREFIX", "ADC0_PREFIX")
epicsEnvSet("PORT",   "m9210-00")
epicsEnvSet("BUFSIZE", "ADC_BUFFER_SIZE")
epicsEnvSet("DEVICE",  "PCI::INSTR0")
ndsCreateDevice "m9210", "$(PORT)", "N_AI=1, DEV=$(DEVICE), OPT=DriverSetup=CAL=0, BUFSIZE=$(BUFSIZE)"

dbLoadRecords "db/m9210.db", "PREFIX=$(PREFIX), IDX=0, MODULEIDX=0,  ASYN_PORT=$(PORT), TIMEOUT=1, BUFSIZE=$(BUFSIZE), PV_EVENT_CNT=GEN-TMG-EVR07:Event-1-Cnt-I, PV_STATS=$(PREFIX):MACB_CW"

#asynSetTraceMask "$(PORT)",       0, "0xFFFF"
#asynSetTraceMask "$(PORT).ai",    0, "0xFFFF"

epicsEnvSet("SRCREC", "$(PREFIX):AI0:ROI")
dbLoadRecords "db/xct-stat.template", "PREFIX=$(PREFIX), NELM=$(BUFSIZE), BUFSIZE=$(BUFSIZE), SRCREC=$(SRCREC), UBUNCHSAMPL=64, IOCNAME=$(IOCNAME), PV_SR_TP=ai, PV_SR=$(PREFIX):CLKF_RB, PV_IMPED_TP=mbbi, PV_IMPED=$(PREFIX):AI0:IMPD_RB"

epicsEnvSet("PREFIX", "ADC1_PREFIX")
epicsEnvSet("PORT",   "m9210-01")
epicsEnvSet("BUFSIZE", "ADC_BUFFER_SIZE")
epicsEnvSet("DEVICE",  "PCI::INSTR1")
ndsCreateDevice "m9210", "$(PORT)", "N_AI=1, DEV=$(DEVICE), OPT=DriverSetup=CAL=0, BUFSIZE=$(BUFSIZE)"

dbLoadRecords "db/m9210.db", "PREFIX=$(PREFIX), IDX=0, MODULEIDX=0,  ASYN_PORT=$(PORT), TIMEOUT=1, BUFSIZE=$(BUFSIZE), PV_EVENT_CNT=GEN-TMG-EVR07:Event-1-Cnt-I, PV_STATS=$(PREFIX):MACB_CW"

#asynSetTraceMask "$(PORT)",       0, "0xFFFF"
#asynSetTraceMask "$(PORT).ai",    0, "0xFFFF"

epicsEnvSet("SRCREC", "$(PREFIX):AI0:ROI")
dbLoadRecords "db/xct-stat.template", "PREFIX=$(PREFIX), NELM=$(BUFSIZE), BUFSIZE=$(BUFSIZE), SRCREC=$(SRCREC), UBUNCHSAMPL=64, IOCNAME=$(IOCNAME), PV_SR_TP=ai, PV_SR=$(PREFIX):CLKF_RB, PV_IMPED_TP=mbbi, PV_IMPED=$(PREFIX):AI0:IMPD_RB"

#############################################
## Timing HW setup                         ##
#############################################

epicsEnvSet("PREFIX", "TMG_PREFIX")

mrmEvrSetupPCI("EVR0_PREFIX",0,9,9,0)
mrmEvrSetupPCI("EVR1_PREFIX",0,9,11,0)

dbLoadRecords("db/elinp-evr.db", "SYS=$(PREFIX), EVR=EVR0_PREFIX, EVT=0")

dbLoadRecords("db/elinp-evr.db", "SYS=$(PREFIX), EVR=EVR1_PREFIX, EVT=0")

epicsEnvSet("CODE",	"249")
epicsEnvSet("EVT", "249")
dbLoadRecords("db/elinp-evrsoft.db", "SYS=$(PREFIX), EVR=EVR0_PREFIX, EVT=$(EVT), CODE=$(CODE)")

epicsEnvSet("CODE",	"1")
epicsEnvSet("EVT",  "1")
dbLoadRecords("db/elinp-evrsoft.db", "SYS=$(PREFIX), EVR=EVR1_PREFIX, EVT=$(EVT), CODE=$(CODE)")


#############################################
## Auto Save/Restore                       ##
#############################################
# Disabled, to enable also edit envSystem (AUTOSAVE_SYSM_PV_PREFIX)
#< "${TOP}/iocBoot/$(IOC)/$(IOC)-preSaveRestore.cmd"


#############################################
## IOC Logging                             ##
#############################################

# iocLogInit


#############################################
## IOC initialization                      ##
#############################################

#cd "${TOP}/db"

iocInit


#############################################
## Timing post initialization config       ##
#############################################

# epicsEnvSet("PREFIX", "GEN-TMG")
# epicsEnvSet("EVR",	"EVR12")
# < "${PTTS}/ioc_config/tmg-EVRsetup.cmd"
# epicsEnvSet("EVR",	"EVR07")
# < "${PTTS}/ioc_config/tmg-EVRsetup.cmd"

# dbpf GEN-TMG-EVR07:Pul0-Evt-Trig0-SP 1
# dbpf GEN-TMG-EVR07:Pul0-Width-SP 10

# dbpf GEN-TMG-EVR07:Pul3-Evt-Trig0-SP 249
# dbpf GEN-TMG-EVR07:Pul3-Width-SP 10

#############################################
## Auto Save/Restore post init config      ##
#############################################
# Disabled
#< "${TOP}/iocBoot/$(IOC)/$(IOC)-postSaveRestore.cmd"

dbl("*") > __CONFIG_DIR__/pvlist.txt
