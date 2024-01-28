#!/bin/sh

xrandr --output eDP-1-1 --off --output HDMI-0 --auto

xrdb ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset s 600 -dpms
setxkbmap -layout us,ru -option grp:alt_shift_toggle
setxkbmap -option compose:ralt

systemctl --user import-environment DISPLAY
exec i3
