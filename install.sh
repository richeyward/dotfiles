#!/bin/bash

cat << EOF
  _____        _    __ _ _             _____           _        _ _           
 |  __ \      | |  / _(_) |           |_   _|         | |      | | |          
 | |  | | ___ | |_| |_ _| | ___  ___    | |  _ __  ___| |_ __ _| | | ___ _ __ 
 | |  | |/ _ \| __|  _| | |/ _ \/ __|   | | | '_ \/ __| __/ _\` | | |/ _ \ '__|
 | |__| | (_) | |_| | | | |  __/\__ \  _| |_| | | \__ \ || (_| | | |  __/ |   
 |_____/ \___/ \__|_| |_|_|\___||___/ |_____|_| |_|___/\__\__,_|_|_|\___|_|"

EOF

echo "[*] - Adding symlinks"
ln -svf $PWD/.config ~
ln -svf $PWD/.local ~
ln -svf $PWD/.profile ~
ln -svf $PWD/.profile ~/.bash_profile
ln -svf $PWD/.profile ~/.zprofile
ln -svf $PWD/.Xdefaults ~
ln -svf $PWD/.Xdefaults ~/.Xresources
echo




echo "[*] - Installing packages"
sudo apt -y install software-properties-common gpg
sudo apt install -y $(cat packages.txt | tr '\n' ' ')


echo "[*] - Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo
