#!/usr/bin/env bash
set -e
cal -3
echo -en "    time: "$(date +"%Y-%m-%d %H:%M:%S" | grep --color=always "[0-9][0-9]:[0-9][0-9]:[0-9][0-9]")"
  uptime: "$(uptime -p)"
   power: "$(acpi | grep --color=always "\([0-9]\+%\)\|\([0-9][0-9]:[0-9][0-9]:[0-9][0-9]\)")"
     led: brightness "$(echo $(cat /sys/class/backlight/intel_backlight/brightness)"*100/$(cat /sys/class/backlight/intel_backlight/max_brightness)" | bc)"%
  system: Last full upgrade [1m"
echo "("$(date +%s)"-"$(date +%s -d "$(tac /var/log/pacman.log | grep -m 1 "^\[.*\] \[PACMAN\] starting full system upgrade\$" | sed -e "s/^\[\(.*\) .*\] \[.*/\1/")")")/86400" | bc | tr '\n' ' '
echo -e "(B[mdays ago"
