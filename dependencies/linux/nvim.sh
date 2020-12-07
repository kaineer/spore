#!/usr/bin/env bash
# url: https://github.com/neovim/neovim/wiki/Installing-Neovim
# needs: wget aliases

mkdir -p ~/bin/appimages
wget https://github.com/neovim/releases/latest/download/nvim.appimage -O ~/bin/appimages/nvim.appimage
chmod 755 ~/bin/appimages/nvim.appimage

echo "alias vim=~/bin/appimages/nvim.appimage" >~/bin/aliases/nvim.sh
chmod 755 ~/bin/aliases/nvim.sh
