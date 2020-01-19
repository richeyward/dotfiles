echo "Adding symlinks"
ln -svf $PWD/.profile ~
ln -svf $PWD/.config ~

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
