#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

# Set up an icon tray
stalonetray &

xscreensaver -no-splash &

# Power Management
xfce4-power-manager &

if [ -x /usr/bin/nm-applet ] ; then
	   nm-applet --sm-disable &
fi

dunst &

exec $HOME/.local/bin/xmonad
