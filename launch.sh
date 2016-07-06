#!/bin/sh

export XDG_RUNTIME_DIR="/run/user/$UID"
#export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"

systemd --user --log-level=debug
#dbus-run-session -- bash

#dbus-run-session -- systemd --user --log-level=debug

find /sys/fs/cgroup/systemd/user.slice/user-1001.slice
