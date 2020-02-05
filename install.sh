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

echo "[*] - Initializing Git submodules"
git submodule init
git submodule update

echo "[*] - Adding symlinks"
ln -svf $PWD/.config ~
ln -svf $PWD/.local ~
ln -svf $PWD/.profile ~
ln -svf $PWD/.profile ~/.bash_profile
ln -svf $PWD/.profile ~/.zprofile
ln -svf $PWD/.xinitrc ~
ln -svf $PWD/.xprofile ~
ln -svf $PWD/.Xdefaults ~
ln -svf $PWD/.Xdefaults ~/.Xresources
ln -svf $PWD/.zshrc ~/
ln -svf $PWD/submodules/ohmyzsh ~/.oh-my-zsh
echo

echo "[*] - Installing packages"
sudo apt install -y $(cat packages.txt | tr '\n' ' ')

if [ ! -f flags/vundle ]; then
    echo "[*] - Installing Vundle"
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo
    touch flags/vundle
fi

if [ ! -f flags/zsh_changed ]; then
    echo "[*] - Changing shell to zsh"
    sudo chsh -s /usr/bin/zsh
    touch flags/zsh_changed
fi

if [ ! -f flags/i3-gaps ]; then
    echo "[*] - Upgrading i3 to i3-gaps"
    cd submodules/i3-gaps-deb; ./i3-gaps-deb
    cd ../../
    touch flags/i3-gaps
fi

if [ ! -f flags/st ]; then
    echo "[*] - Installing st"
    cd submodules/st; sudo make install
    cd ../../
    touch flags/st
fi
