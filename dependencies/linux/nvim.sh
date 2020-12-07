#!/usr/bin/env bash
# url: https://github.com/neovim/neovim/wiki/Installing-Neovim
# needs: wget aliases

NVIM_DIR="$HOME/bin/appimages"

mkdir -p $NVIM_DIR
wget https://github.com/neovim/releases/latest/download/nvim.appimage -O $NVIM_DIR/nvim.appimage
chmod 755 $NVIM_DIR/nvim.appimage

echo "alias vim=$NVIM_DIR/nvim.appimage" >~/bin/aliases/nvim.sh
chmod 755 ~/bin/aliases/nvim.sh
