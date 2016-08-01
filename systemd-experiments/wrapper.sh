#!/bin/bash

control_c(){ echo trap; }

trap control_c SIGINT

export XDG_RUNTIME_DIR="/run/user/$UID"
#export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

COLOUR="\033[3m\033[32m"
NO_COLOUR="\033[0m"

echo -e "${COLOUR}[dbus launch]${NO_COLOUR}"

dbus-run-session -- ./launch.sh

echo -e "${COLOUR}[dbus terminate]${NO_COLOUR}"
