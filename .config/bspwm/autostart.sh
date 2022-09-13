#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# xrandr --output LVDS-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output HDMI-1 --mode 1600x900 --pos 1366x0 --rotate normal --output HDMI2 --off --output HDMI3 --off --output VGA1 --off --output VIRTUAL1 --off

$HOME/.config/polybar/launch.sh &

sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

xsetroot -cursor_name left_ptr &

pamixer --set-volume 100 &

xfce4-power-manager &
lxpolkit &
picom --config $HOME/.config/picom.conf --experimental-backends &
nitrogen --restore &
dunst &

