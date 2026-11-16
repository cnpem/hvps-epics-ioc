# Save and restore setup

save_restoreSet_status_prefix("$(PREFIX)")
save_restoreSet_Debug(0)

save_restoreSet_IncompleteSetsOk(1)
save_restoreSet_DatedBackupFiles(1)

save_restoreSet_NumSeqFiles(3)
save_restoreSet_SeqPeriodInSeconds(300)

set_savefile_path("/var/opt/hvps-epics-ioc", "autosave")

set_pass0_restoreFile("$(PREFIX)_settings.sav")
set_pass1_restoreFile("$(PREFIX)_settings.sav")

set_requestfile_path("$(TOP)", "HVPSApp/Db")

afterIocRunning "create_monitor_set('hvps.req', 30, 'P=$(PREFIX)')"
afterIocRunning "set_savefile_name('hvps.req', '$(PREFIX).sav')"
