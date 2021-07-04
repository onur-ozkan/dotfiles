#! /bin/bash

# default configuration of audio on boot
pactl set-sink-volume 0 50%
pactl set-sink-mute @DEFAULT_SINK@ true

feh --bg-scale ~/.firewatch-dark.jpg

dwmblocks &
