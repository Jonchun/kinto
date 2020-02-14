#!/usr/bin/env bash
# xkb_setup.sh
#
# parameters configName symbols types
#
# Example
#
# setxkbmap -option
# setxkbmap -print | \
# sed 's/symbols.*)/&+ctrl(swap_lwin_lctl)+ctrl(swap_rwin_rctl)+mac_gui(mac_levelssym)/' | \
# sed 's/types\s*{\s*include\s*\"\w*/&+mac_gui(addmac_levels)/' | \
# xkbcomp -w0 -I$HOME/.xkb - $DISPLAY

mkdir -p /tmp/kinto

CONFIGNAME=$1
SYMBOLS=$2
TYPES=$3

setxkbmap -option;setxkbmap -print | sed "s/symbols.*)/&$SYMBOLS/" | sed "s/types\s*{\s*include\s*\"\w*/&$TYPES/" > /tmp/kinto/$CONFIGNAME
