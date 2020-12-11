#!/usr/bin/env bash
# needs: node-stable

REPO_URL=https://github.com/kaineer/nvim-config.git
DEST_DIR="$HOME/git/config/nvim"

git clone $REPO_URL $DEST_DIR >/dev/null 2>/dev/null

if [[ "$?" != "0" ]]; then
  exit 1
else
  NVIM_CONF_FILE="$HOME/.config/nvim/init.vim"

  mkdir -p "$HOME/.config/nvim"
  echo "\""                                > $NVIM_CONF_FILE
  echo "source ~/git/config/nvim/init.vim" >> $NVIM_CONF_FILE
fi
