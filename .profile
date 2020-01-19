#!/bin/sh

#Load each file in the profile directory
profiledir=$(dirname "$(realpath ~/.profile)")/profile
for DOTFILE in $(find $profiledir); do
	if [ -f "$DOTFILE" ]; then 
		source "$DOTFILE"
	fi
done

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
