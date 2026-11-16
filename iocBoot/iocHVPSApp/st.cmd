#!/opt/hvps-epics-ioc/bin/linux-x86_64/HVPS
#
# hvps configuration
#
# The following parameters must be defined before loading this configuration:
#
# $(IP_ADDR)
# Device's IP address
#
# $(IP_PORT)
# Device's IP port
#
# $(PREFIX)
# PVs prefix

< /opt/hvps-epics-ioc/iocBoot/iocHVPSApp/envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/HVPS.dbd"
HVPS_registerRecordDeviceDriver pdbbase

## Setup environment variables
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/HVPSApp/Db")
epicsEnvSet("PORT", "HVPS")

## Set up address
drvAsynIPPortConfigure("$(PORT)", "$(IP_ADDR):$(IP_PORT)", 0, 0, 0)
asynSetOption("$(PORT)", 0, "disconnectOnReadTimeout", "Y")

## Load record instances
dbLoadRecords("$(TOP)/db/hvps.db", "P=$(PREFIX), PORT=$(PORT)")

## Load asynRecord for device connection monitoring
dbLoadRecords("$(TOP)/db/asynRecord.db", "P=$(PREFIX), R=asyn, PORT=$(PORT), ADDR=0, OMAX=80, IMAX=80")

## Load autosave monitoring records
dbLoadRecords("$(TOP)/db/save_restoreStatus.db", "P=$(PREFIX)")

cd "${TOP}/iocBoot/${IOC}"

## Configure autosave
< save_restore.cmd

iocInit
