#/bin/bash
# This script does a few things:
# 1. Unpacks this packages' files into their respective places
# 2. Installs Vundle (for vim)
# Note: This assumes you run this file from within the directory it is located. It will likely do some weird stuff if you don't

# i3 settings & mods
mkdir ~/.i3
cp config ~/.i3
cp screenfix.sh ~/

# ssh
cp ssh-ubuserver.sh ~/
cp ssh-ips ~/
cp git-sync.sh ~/
cp update-lconf.sh ~/

# misc
cp steamfix.sh ~/
cp temp ~/

# sets up vim.
cp .vimrc ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Run an install for vim with your package manager after this if you haven't already"
echo "Then run \"PluginInstall\" on vim"
