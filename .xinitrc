#         _       _ _            
#   __  _(_)_ __ (_) |_ _ __ ___ 
#   \ \/ / | '_ \| | __| '__/ __|
#  _ >  <| | | | | | |_| | | (__ 
# (_)_/\_\_|_| |_|_|\__|_|  \___|

# set keyboard layout
setxkbmap se

# set display resolution and refresh rate (xrandr in xorg for info)
xrandr --output DP-2 --mode 2560x1440 --rate 144
xrandr --output DP-4 --mode 2560x1080 --rate 60

# set mouse behaviour (xinput list and xinput --set-prop N 'libinput PROPERTY' VALUE)
xinput --set-prop 9 'libinput Accel Speed' -1  # wireless adapter
xinput --set-prop 8 'libinput Accel Speed' -1  # wired connection

# decrease repeated keypress delay
xset r rate 300 50

## set wallpaper
#xwallpaper --zoom /usr/share/backgrounds/archlinux/conference.png

## load compositor
#picom -b

## start notification daemon
#dunst &

## remove mouse pointer when idle
#unclutter &

## start dwmblocks
#dwmblocks &

## load dwm window manger
#exec dwm

# load xfce4
exec startxfce4
