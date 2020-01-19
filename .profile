#!/bin/sh

#Load each file in the profile directory
profiledir=$(dirname "$(realpath ~/.profile)")/profile
for DOTFILE in $(find $profiledir); do
	if [ -f "$DOTFILE" ]; then 
		source "$DOTFILE"
	fi
done
