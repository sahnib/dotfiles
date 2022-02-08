#!/bin/sh

export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=$PATH:$HOME/.local/bin

exec xmonad
