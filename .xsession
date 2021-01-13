#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Screens
vga=`xrandr | grep ' connected' | grep 'VGA1' | awk '{print $1}'`

if [ "$vga" = "VGA1" ]; then
  xrandr --output LVDS1 --primary --mode 1024X600 --pos 276x1080 --output VGA1 --mode 1024x768 --pos 0x0 &
else
  xrandr --output LVDS1 --primary --mode 1024X600 --pos 0x0 --rotate normal --output VGA1 --off --output DP-1 --off &
fi

# Composer
picom &
# Network
nm-applet &
# Keyboard Layout
setxkbmap es &
# Automount Devices
udiskie -t &
# Wallpaper
feh --bg-scale fondos/wallpaper.jpg &

