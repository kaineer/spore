#!/usr/bin/env bash
# needs: wget

mkdir -p "$HOME/git/tmp"

cd "$HOME/git/tmp"
wget https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip -O FiraCode.zip
mkdir FiraCode
unzip FiraCode.zip -d FiraCode/
rm FiraCode.zip
cd - >/dev/null
