TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Build the IOC application
PROD_IOC = HVPS

# HVPS.dbd will be created and installed
DBD += HVPS.dbd

HVPS_DBD += base.dbd

HVPS_LIBS += asyn
HVPS_DBD += asyn.dbd
HVPS_DBD += drvAsynIPPort.dbd

HVPS_LIBS += stream
HVPS_DBD += stream-base.dbd

HVPS_LIBS += autosave
HVPS_DBD += asSupport.dbd

# HVPS_registerRecordDeviceDriver.cpp derives from HVPS.dbd
HVPS_SRCS += HVPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
HVPS_SRCS_DEFAULT += HVPSMain.cpp
HVPS_SRCS_vxWorks += -nil-

# Finally link IOC to the EPICS Base libraries
HVPS_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE
