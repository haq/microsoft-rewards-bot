#!/bin/sh

# set display port and dbus env to avoid hanging (https://github.com/joyzoursky/docker-python-chromedriver)
export DISPLAY=:99
export DBUS_SESSION_BUS_ADDRESS=/dev/null

# start vxfb
Xvfb :99 -screen 0 640x480x8 -nolisten tcp &

# start the script
exec "$@"
