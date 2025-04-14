#############################################
## EVR event on external input trigger     ##
#############################################

## Set EVR to emit event "CODE" on external trigger on input INP
dbpf("$(PREFIX)-$(EVR):FPIn$(INP)-Edge-Sel","Active Rising")
dbpf("$(PREFIX)-$(EVR):FPIn$(INP)-Trig-Ext-Sel","Edge")


