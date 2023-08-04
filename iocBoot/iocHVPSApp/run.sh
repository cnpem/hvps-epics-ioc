#!/usr/bin/env bash

set -ue

export P="${BEAMLINE}:"
export R="${HUTCH}:"

socket_path=./ioc.sock
mkdir -p /var/opt/hvps-epics-ioc/autosave

procServ -f -i ^C^D -L - unix:$socket_path ./st.cmd
