#!/bin/bash
#

DEFAULT="/usr/share/backgrounds/bg-crononauta-1920x1080-dark.png"

if [ ! -z "$1" ] && [ -e "$1" ]
then
  DEFAULT="$1"
fi

/usr/bin/nitrogen --set-tiled $DEFAULT
