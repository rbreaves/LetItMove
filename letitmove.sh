#!/usr/bin/env bash

# TODO
# - Add in the ability to relocate the default
#   workspace of the terminal app to whichever workspace
#   is active
# - Detect which monitor PiPs is on & if it is not the
#   same as the monitor that the budgie-panel default is
#   on then restart the devilspie service when/if PiP is
#   brought back to the default monitor.
#  - Setup my custom devilspie2 configs and systemd service

mapfile -t allWindows < <( wmctrl -lx | awk '{printf $1FS$3; for (i=5; i <= NF; i++) printf FS$i; print NL }' )

ignoreMe=( "Toolkit.Waterfox" "nemo-desktop.Nemo-desktop" "plank.Plank" "com.github.rafostar.Clapper.com.github.rafostar.Clapper" "budgie-panel.Budgie-panel" )

i=0
len=${#allWindows[@]}
while [ $i -lt $len ];
do
    if [[ ! " ${ignoreMe[*]} " =~ `echo ${allWindows[$i]} | awk '{print $2}'` ]]; then
        echo ${allWindows[$i]}
        wmctrl -i -r `echo ${allWindows[$i]} | awk '{print $1}'` -t 2
    fi
    let i++
done

# Move active application btwn dual monitors
# https://gist.github.com/xoner/2947175