exec dwm &dwmblocks

sleep 1

sudo rmmod i2c_hid && sudo modprobe i2c_hid
asusctl profile silent
