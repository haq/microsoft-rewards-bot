#!/bin/sh

color() {
    printf "\033[33m$1\033[0m\n"
}

color "git pull"
git pull --quiet

color "pip install"
pip install --root-user-action=ignore --no-cache-dir --quiet -r requirements.txt

# set display port and dbus env to avoid hanging (https://github.com/joyzoursky/docker-python-chromedriver)
export DISPLAY=:99
export DBUS_SESSION_BUS_ADDRESS=/dev/null

color "starting xvfb"
Xvfb :99 -screen 0 1280x800x8 -nolisten tcp &

color "starting script"
exec "$@"
