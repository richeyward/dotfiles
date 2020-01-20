echo "Adding symlinks"
ln -svf $PWD/.config ~
ln -svf $PWD/.profile ~
ln -svf $PWD/.local/bin ~/.local

echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
