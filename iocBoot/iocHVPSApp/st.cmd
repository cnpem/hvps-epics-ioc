#!../../bin/linux-x86_64/HVPS

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/HVPS.dbd"
HVPS_registerRecordDeviceDriver pdbbase

## Setup environment variables
epicsEnvSet("P", "${P}")
epicsEnvSet("R", "${R}")
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(TOP)/HVPSApp/Db")
epicsEnvSet("PORT", "HVPS")

## Set up address
drvAsynIPPortConfigure("$(PORT)", "${HVPS_IP_ADDRESS}:${HVPS_PORT}", 0, 0, 0)
asynSetOption("$(PORT)", 0, "disconnectOnReadTimeout", "Y")

## Load record instances
dbLoadRecords("$(TOP)/db/hvps.db", "P=$(P), R=$(R), PORT=$(PORT)")

## Load asynRecord for device connection monitoring
dbLoadRecords("$(TOP)/db/asynRecord.db", "P=$(P)$(R), R=asyn, PORT=$(PORT), ADDR=0, OMAX=80, IMAX=80")

## Load autosave monitoring records
dbLoadRecords("$(TOP)/db/save_restoreStatus.db", "P=$(P)$(R)")

cd "${TOP}/iocBoot/${IOC}"

## Configure autosave
< save_restore.cmd

iocInit

create_monitor_set("hvps.req", 30, "P=$(P), R=$(R)")
set_savefile_name("hvps.req", "$(P)$(R).sav")
