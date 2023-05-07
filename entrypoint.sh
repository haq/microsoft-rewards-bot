#!/bin/sh

# pull the latest version of the app
git pull > /dev/null

# install any new dependencies
pip install --root-user-action=ignore -r requirements.txt > /dev/null

# set display port and dbus env to avoid hanging (https://github.com/joyzoursky/docker-python-chromedriver)
export DISPLAY=:99
export DBUS_SESSION_BUS_ADDRESS=/dev/null

# start vxfb
Xvfb :99 -screen 0 640x480x8 -nolisten tcp &

# start the script
exec "$@"
