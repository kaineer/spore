#!/usr/bin/env bash
# needs: wget

mkdir -p "$HOME/git/tmp"

wget https://github.com/alacritty/alacritty/releases/download/v0.3.3/Alacritty-v0.3.3-ubuntu_18_04_amd64.deb -O "$HOME/git/tmp/alacritty.deb"

sudo dpkg -i "$HOME/git/tmp/alacritty.deb"
