#! /bin/bash

# increase cursor speed
xset r rate 250 45

# default configuration of audio on boot
pactl set-sink-volume 0 50%
pactl set-sink-mute @DEFAULT_SINK@ true

feh --bg-scale ~/.backgrounds/.black-and-white.jpg

xcompmgr &

dwmblocks &
