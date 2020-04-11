#!/bin/bash

cat << EOF
  _____        _    __ _ _             _____           _        _ _
 |  __ \      | |  / _(_) |           |_   _|         | |      | | |          
 | |  | | ___ | |_| |_ _| | ___  ___    | |  _ __  ___| |_ __ _| | | ___ _ __ 
 | |  | |/ _ \| __|  _| | |/ _ \/ __|   | | | '_ \/ __| __/ _\` | | |/ _ \ '__|
 | |__| | (_) | |_| | | | |  __/\__ \  _| |_| | | \__ \ || (_| | | |  __/ |   
 |_____/ \___/ \__|_| |_|_|\___||___/ |_____|_| |_|___/\__\__,_|_|_|\___|_|"

EOF

mkdir -p submodules flags

if [ ! -f flags/git_submodules ]; then
	echo "[*] - Initializing Git submodules"
	git submodule init
	git submodule update
	touch flags/git_submodules
fi

if [ ! -f flags/symlinks ]; then
	echo "[*] - Adding symlinks"
	ln -svf $PWD/.config ~
	mkdir -p ~/.local
	ln -svf $PWD/.local/bin ~/.local
	ln -svf $PWD/.profile ~
	ln -svf $PWD/.profile ~/.bash_profile
	ln -svf $PWD/.profile ~/.zprofile
	ln -svf $PWD/.xinitrc ~
	ln -svf $PWD/.xprofile ~
	ln -svf $PWD/.Xdefaults ~
	ln -svf $PWD/.Xdefaults ~/.Xresources
	ln -svf $PWD/.zshrc ~/
	ln -svf $PWD/submodules/ohmyzsh ~/.oh-my-zsh
	touch flags/symlinks
	echo
fi

if [ ! -f flags/apt_install ]; then
	echo "[*] - Installing packages"
	sudo apt update
	sudo apt install -y $(cat packages.txt | tr '\n' ' ')
	touch flags/apt_install
fi

for f in .install_scripts/*.sh; do
    FLAG=$(echo $f | cut -d "/" -f2 | cut -d "." -f1)
    if [ ! -f flags/$FLAG ]; then
    	./$f
	touch flags/$FLAG
    fi
done
