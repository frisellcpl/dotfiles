xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.75

xset r rate 170 50
xset -b

setxkbmap -option ctrl:nocaps -layout gb
setxkbmap -option compose:prsc

xrdb -merge ~/.Xresources

feh --bg-scale pictures/wallpapers/wdd3.jpg

emacs --daemon

exec xmonad
