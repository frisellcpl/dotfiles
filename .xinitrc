xrandr --newmode "2560x1440"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --newmode "1920x1080"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode DP1 "2560x1440"
xrandr --addmode eDP1 "1920x1080"
xrandr --output VIRTUAL1 --off --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --mode 2560x1440 --pos 1920x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output VGA1 --off

setxkbmap -option ctrl:nocaps -layout gb
feh --bg-scale '/home/frissan/pictures/astro_1.jpg'

xrdb -merge ~/.Xresources

emacs --daemon

exec xmonad
