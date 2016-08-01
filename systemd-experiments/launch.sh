#!/bin/sh
#
# run from wrapper.sh to set XDG_RUNTIME_DIR & friends

echo "* XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR"
echo "* DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS"

##systemd --user --log-level=debug
#dbus-run-session -- bash

#dbus-run-session -- systemd --user --log-level=debug

##find /sys/fs/cgroup/systemd/user.slice/user-1001.slice

sleep 2
systemctl --user status
#systemctl --user enable

systemd --user --log-level=debug

sleep 999
