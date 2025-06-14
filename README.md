# EPIK8s Chart for eli

This documentation is automatically generated by *epik8s-tools* (0.6.9).

## Table of Contents
- [Beamline](#beamline)

- [NFS Mounts](#nfs-mounts)
- [IO Controllers (IOCS)](#iocs)
- [EPIK8s Services](#services)
- [Application](#applications)



## Beamline

**BEAMLINE**: `eli`

**BEAMLINE URL**: `https://baltig.infn.it/lnf-da-control/epik8s-eli.git`

**BEAMLINE REV**: `devel`

**Services DNS**: `int.eli-np.ro`

**Namespace**: `eli`

**EPIK8s charts default revision**: `main`

**CA Gateway**: `10.16.4.202`

**PVA Gateway**: `10.16.4.203`




---

## NFS Mounts

| Name               | Server                 | Src                                      | Dst                    |
|--------------------|------------------------|------------------------------------------|------------------------|
| data               | 192.168.197.157        | /data_epik8s/eli/data                    | /nfs/data              |
| autosave           | 192.168.197.157        | /data_epik8s/eli/autosave                | /nfs/autosave          |
| config             | 192.168.197.157        | /data_epik8s/eli/config                  | /nfs/config            |

---




## IOCs

| Name             | Type       | Group      | Prefix                   |Template    | OPI                   | OPI Main   | OPI Macros                   |Description                                         |
|------------------|------------|------------|--------------------------|------------|------------------------|-----------|-------------------------|----------------------------------------------------|

| [llrf01          ](#llrf01) | llrf       | rf         | LEL-RF-LLRF03:          | libera-llrf | -                      | -          | -                              | https://confluence.infn.it/x/doKBBg                |

| [orbit           ](#orbit) | softioc    | diag       | LEL:ORBIT:              |            | -                      | -          | -                              | https://confluence.infn.it/x/nYD8DQ                |

| [biltitest-cpsu03](#biltitest-cpsu03) | bilt-itest | mag        | LEL:MAG:CPSU03:         | ibilt-test | https://baltig.infn.it/infn-epics/mag-opi.git | biltitest/biltitest.bob | P=LEL:MAG:CPSU03               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111616 |

| [cam-sim02       ](#cam-sim02) | camerasim  | diag       | LEL:TST02               | camera     | https://baltig.infn.it/infn-epics/camera-opi.git | Camera_Main.bob | CAM=TST02 DEVICE=LEL           | Simulate a camera with beam X=250,Y=200 DX=70 DY=50 |

| [cam01           ](#cam01) | camera     | diag       | LEL:SCN01:CAM01         | camera     | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2748&objectId=126655 |

| [cam02           ](#cam02) | camera     | diag       | LEL:SCN02:CAM01         | camera     | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2748&objectId=126656 |

| [cam03           ](#cam03) | camera     | diag       | LEL:SCN03:CAM01         | camera     | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2748&objectId=126656 |

| [cam-sim01       ](#cam-sim01) | camera     | diag       | LEL:TST01               | camera     | -                      | -          | -                              | https://confluence.infn.it/x/nYD8DQ                |

| [mrf-laser-delay ](#mrf-laser-delay) | evr230     | timing     | LEL:TIM:                | cosylabioc | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2441&mode=object&objectId=113215 |

| [mrf-rf-delay    ](#mrf-rf-delay) | evr230     | timing     | LEL:TIM:                | cosylabioc | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2441&mode=object&objectId=119372 |

| [mrf-diag-delay  ](#mrf-diag-delay) | evr230     | timing     | LEL:TIM:                | cosylabioc | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2441&mode=object&objectId=119372 |

| [mrf-evg         ](#mrf-evg) | mrf230     | timing     | LEL:TIM:                | cosylabioc | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2441&mode=object&objectId=113217 |

| [key-gp08        ](#key-gp08) | m9210      | adc        | LEL:DIA:                | cosylabioc | -                      | -          | -                              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2446&mode=object&objectId=119372 |

| [polrev-icpdas01 ](#polrev-icpdas01) | icp7060    | polarity_reversal | LEL:POLREV:ICPDAS01     | icpdas     | https://baltig.infn.it/infn-epics/icpdas-opi.git | icp7060.bob | R=ICPDAS01 P=LEL:POLREV        | https://confluence.infn.it/x/nYD8DQ                |

| [polrev-icpdas02 ](#polrev-icpdas02) | icp7060    | polarity_reversal | LEL:POLREV:ICPDAS02     | icpdas     | https://baltig.infn.it/infn-epics/icpdas-opi.git | icp7060.bob | R=ICPDAS02 P=LEL:POLREV        | https://confluence.infn.it/x/nYD8DQ                |

| [vgcon01         ](#vgcon01) | xgs600     | vgc        | LEL:VAC:VGCON01:        | agilent-vac | https://baltig.infn.it/infn-epics/vac-opi.git | agilentXgs600/agilentXgs600Ctlr.bob | P=LEL:VAC:VGCON01              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2505&objectId=111736 |

| [vgcon02         ](#vgcon02) | xgs600     | vgc        | LEL:VAC:VGCON02:        | agilent-vac | https://baltig.infn.it/infn-epics/vac-opi.git | agilentXgs600/agilentXgs600Ctlr.bob | P=LEL:VAC:VGCON02              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2505&objectId=111737 |

| [vpcon17         ](#vpcon17) | 4uhv       | vpc        | LEL:VAC:VPCON17:        | agilent-vac | https://baltig.infn.it/infn-epics/vac-opi.git | agilent4uhv/agilent4uhv.bob | P=LEL:VAC:VPCON17              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2505&objectId=129492 |

| [vpcon19         ](#vpcon19) | 4uhv       | vpc        | LEL:VAC:VPCON19:        | agilent-vac | https://baltig.infn.it/infn-epics/vac-opi.git | agilent4uhv/agilent4uhv.bob | P=LEL:VAC:VPCON19              | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2505&objectId=129491 |

| [wgsvpcon01      ](#wgsvpcon01) | 4uhv       | vpc        | LEL:VAC:WGS1:VPCON01:   | agilent-vac | https://baltig.infn.it/infn-epics/vac-opi.git | agilent4uhv/agilent4uhv.bob | P=LEL:VAC:WGS1:VPCON01         | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2505&objectId=111743 |

| [wgsvpcon02      ](#wgsvpcon02) | 4uhv       | vpc        | LEL:VAC:WGS1:VPCON02:   | agilent-vac | https://baltig.infn.it/infn-epics/vac-opi.git | agilent4uhv/agilent4uhv.bob | P=LEL:VAC:WGS1:VPCON02         | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2505&objectId=111743 |

| [sigmaphi-SOL01-SPSU01](#sigmaphi-sol01-spsu01) | sigmaphi   | mag        | LEL:MAG:SPSU01:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:SPSU01               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111614 |

| [sigmaphi-SOL01-SPSU02](#sigmaphi-sol01-spsu02) | sigmaphi   | mag        | LEL:MAG:SPSU02:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:SPSU02               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111615 |

| [biltitest-cpsu01](#biltitest-cpsu01) | biltitest  | mag        | LEL:MAG:CPSU01:         | ibilt-test | https://baltig.infn.it/infn-epics/mag-opi.git | biltitest/biltitest.bob | P=LEL:MAG:CPSU01               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111616 |

| [sigmaphi-SOL02-SPSU03](#sigmaphi-sol02-spsu03) | sigmaphi   | mag        | LEL:MAG:SPSU03:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:SPSU03               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111617 |

| [sigmaphi-SOL02-SPSU04](#sigmaphi-sol02-spsu04) | sigmaphi   | mag        | LEL:MAG:SPSU04:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:SPSU04               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111618 |

| [sigmaphi-SOL02-SPSU05](#sigmaphi-sol02-spsu05) | sigmaphi   | mag        | LEL:MAG:SPSU02:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:SPSU02               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111615 |

| [sigmaphi-SOL02-SPSU06](#sigmaphi-sol02-spsu06) | sigmaphi   | mag        | LEL:MAG:SPSU06:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:SPSU06               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111620 |

| [biltitest-cpsu02](#biltitest-cpsu02) | biltitest  | mag        | LEL:MAG:CPSU02:         | ibilt-test | https://baltig.infn.it/infn-epics/mag-opi.git | biltitest/biltitest.bob | P=LEL:MAG:CPSU02               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111621 |

| [sigmaphi-DPSU01 ](#sigmaphi-dpsu01) | sigmaphi   | mag        | LEL:MAG:DPSU01:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:DPSU01               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111626 |

| [sigmaphi-QPSU01 ](#sigmaphi-qpsu01) | sigmaphi   | mag        | LEL:MAG:QPSU01:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:QPSU01               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111623 |

| [sigmaphi-QPSU02 ](#sigmaphi-qpsu02) | sigmaphi   | mag        | LEL:MAG:QPSU02:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:QPSU02               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111624 |

| [sigmaphi-QPSU03 ](#sigmaphi-qpsu03) | sigmaphi   | mag        | LEL:MAG:QPSU03:         | sigmaphi   | https://baltig.infn.it/infn-epics/mag-opi.git | sigmaphi/sigmaphi.bob | P=LEL:MAG:QPSU03               | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2457&mode=object&objectId=111625 |

| [motor-tml       ](#motor-tml) | tml        | motor      | LEL:TEST:               | motor      | https://baltig.infn.it/infn-epics/motor-tml-opi.git | TML.bob    | CONFFILE= PREFIX=LEL:TEST      | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2447&objectId=133401 |

| [diag-tml        ](#diag-tml) | tml        | motor      | LEL:                    | motor      | https://baltig.infn.it/infn-epics/motor-tml-opi.git | TML.bob    | CONFFILE= PREFIX=LEL           | https://servicedesk.infn.it/secure/ObjectSchema.jspa?id=44&typeId=2447&objectId=133401 |

| [unimag          ](#unimag) | unimag     | mag        | LEL:MAG:                | unimag     | https://baltig.infn.it/infn-epics/unimag.git | opi/unimag.bob | CONFFILE=elimagsim.yaml P=LEL:MAG TITLE=Unimag eli  | https://confluence.infn.it/display/SCS/Magnet+SoftIOC+Devil+Wrapper |


---

---

### biltitest-cpsu03
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.49                       |

---

### cam-sim02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| CAMERA_TYPE      | Int8                             |
| CAMERA_FTVL      | UCHAR                            |
| CAMERA_ELEMS     | 325546                           |
| CAMERA_STATS_XSIZE | 1024                             |
| CAMERA_STATS_YSIZE | 768                              |

---
### Initialization

| Name             | Value                             |
|------------------|-----------------------------------|
| AcquirePeriod    | 1                                |
| Gain             | 255                              |
| SimMode          | Peaks                            |
| PeakStartX       | 250                              |
| PeakStartY       | 200                              |
| PeakWidthX       | 70                               |
| PeakWidthY       | 50                               |
| PeakVariation    | 10                               |

---

---

### cam01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| CAMERA_ID        | Basler-a2A1920-51gmBAS-40458493  |
| CAMERA_CLASS     | Basler-a2A2600-20gmBAS           |
| CAMERA_TYPE      | Int8                             |
| CAMERA_FTVL      | UCHAR                            |
| CAMERA_ELEMS     | 325546                           |
| CAMERA_STATS_XSIZE | 1024                             |
| CAMERA_STATS_YSIZE | 768                              |

---
### Initialization

| Name             | Value                             |
|------------------|-----------------------------------|
| AcquirePeriod    | 1                                |
| FrameRate        | 1                                |
| FrameRateEnable  | Yes                              |

---

---

### cam02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| CAMERA_ID        | Basler-a2A1920-51gmBAS-40458497  |
| CAMERA_CLASS     | Basler-a2A2600-20gmBAS           |
| CAMERA_TYPE      | Int8                             |
| CAMERA_FTVL      | UCHAR                            |
| CAMERA_ELEMS     | 325546                           |
| CAMERA_STATS_XSIZE | 1024                             |
| CAMERA_STATS_YSIZE | 768                              |

---
### Initialization

| Name             | Value                             |
|------------------|-----------------------------------|
| AcquirePeriod    | 1                                |
| FrameRate        | 1                                |
| FrameRateEnable  | Yes                              |

---

---

### cam03
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| CAMERA_ID        | Basler-a2A1920-51gmBAS-40458491  |
| CAMERA_CLASS     | Basler-a2A2600-20gmBAS           |
| CAMERA_TYPE      | Int8                             |
| CAMERA_FTVL      | UCHAR                            |
| CAMERA_ELEMS     | 325546                           |
| CAMERA_STATS_XSIZE | 1024                             |
| CAMERA_STATS_YSIZE | 768                              |

---
### Initialization

| Name             | Value                             |
|------------------|-----------------------------------|
| AcquirePeriod    | 1                                |
| FrameRate        | 1                                |
| FrameRateEnable  | Yes                              |

---

---

### cam-sim01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| CAMERA_TYPE      | Int8                             |
| CAMERA_FTVL      | UCHAR                            |
| CAMERA_ELEMS     | 325546                           |
| CAMERA_STATS_XSIZE | 1024                             |
| CAMERA_STATS_YSIZE | 768                              |

---
### Initialization

| Name             | Value                             |
|------------------|-----------------------------------|
| AcquirePeriod    | 1                                |
| Gain             | 255                              |
| SimMode          | Peaks                            |
| PeakStartX       | 250                              |
| PeakStartY       | 200                              |
| PeakWidthX       | 70                               |
| PeakWidthY       | 50                               |
| PeakVariation    | 10                               |

---

---

### polrev-icpdas01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.32                       |

---

### polrev-icpdas02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.33                       |

---

### vgcon01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.57                       |
| port             | 4001                             |

---

### vgcon02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.57                       |
| port             | 4003                             |

---

### vpcon17
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.57                       |
| port             | 4002                             |

---

### vpcon19
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.57                       |
| port             | 4004                             |

---

### wgsvpcon01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.58                       |
| port             | 4001                             |

---

### wgsvpcon02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.58                       |
| port             | 4001                             |

---

### sigmaphi-SOL01-SPSU01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.45                       |

---

### sigmaphi-SOL01-SPSU02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.40                       |

---

### biltitest-cpsu01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.48                       |

---

### sigmaphi-SOL02-SPSU03
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.46                       |

---

### sigmaphi-SOL02-SPSU04
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.46                       |

---

### sigmaphi-SOL02-SPSU05
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.42                       |

---

### sigmaphi-SOL02-SPSU06
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.43                       |

---

### biltitest-cpsu02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.44                       |

---

### sigmaphi-DPSU01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.53                       |

---

### sigmaphi-QPSU01
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.50                       |

---

### sigmaphi-QPSU02
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.51                       |

---

### sigmaphi-QPSU03
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| server           | 10.16.4.52                       |

---

### unimag
#### Params

| Name             | Value                             |
|------------------|-----------------------------------|
| CONFIG           | elimagsim.yaml                   |

---

---

---

## Services
| Name             | URL                            | Balancer      | Chart                          |Description                                         |
|------------------|--------------------------------|---------------|--------------------------------|----------------------------------------------------|
  | gateway          | -                              | 10.16.4.202 | https://baltig.infn.it/epics-containers/ca-gateway-chart.git |                                                    |
  | pvagateway       | -                              | 10.16.4.203 | https://baltig.infn.it/epics-containers/ca-gateway-chart.git |                                                    |
  | archiver         | http://eli-archiver.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/epics-archiver-chart.git |                                                    |
  | console          | http://eli-console.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/epics-console-chart.git |                                                    |
  | notebook         | http://eli-notebook.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/jupyter-chart.git |                                                    |
  | webalarm         | http://eli-webalarm.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | pws              | http://eli-pws.int.eli-np.ro   | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | dbwr             | http://eli-dbwr.int.eli-np.ro  | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | olog             | http://eli-olog.int.eli-np.ro  | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | saveandrestore   | http://eli-saveandrestore.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | alarmserver      | http://eli-alarmserver.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | alarmlogger      | http://eli-alarmlogger.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | channelfinder    | http://eli-channelfinder.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/channelfinder-chart.git |                                                    |
  | scanserver       | http://eli-scanserver.int.eli-np.ro | -          | https://baltig.infn.it/epics-containers/phoebus-services-chart.git |                                                    |
  | mysql            | -                              | -          | registry-1.docker.io/bitnamicharts |                                                    |

---
## Applications
| Name             | App Repo                       | Image                          |Description                                         |
|------------------|--------------------------------|--------------------------------|----------------------------------------------------|
  | icpdastemp01     | https://baltig.infn.it/chaos-lnf-control/py-modbus-device-simulator.git | baltig.infn.it:4567/epics-containers/epics-py-base |                                                    |
## Phoebus Settings
You can find phoebus settings for epik8s `eli` in **opi/settings.ini**

