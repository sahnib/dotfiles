#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=$PATH:$HOME/.local/bin

feh --bg-scale $HOME/Downloads/archlinux-1.jpg

xrdb merge $HOME/.Xresources

exec xmonad
