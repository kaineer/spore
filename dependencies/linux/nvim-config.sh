#!/usr/bin/env bash

git clone https://github.com/kaineer/nvim-config.git ~/git/config/nvim >/dev/null 2>/dev/null

if [[ "$?" != "0" ]]; then
  exit 1
else
  NVIM_CONF_FILE="$HOME/.config/nvim/init.vim"

  echo "\""                                > $NVIM_CONF_FILE
  echo "source ~/git/config/nvim/init.vim" >> $NVIM_CONF_FILE
fi
