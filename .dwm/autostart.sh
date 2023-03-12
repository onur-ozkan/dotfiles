#! /bin/bash

# increase cursor speed
xset r rate 200 65

sbs ~/.backgrounds/.firewatch-dark.jpg

dwmblocks &

sleep 4

# Trigger volume on dwmblokcs
kill -44 $(pidof dwmblocks)
