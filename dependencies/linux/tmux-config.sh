#!/usr/bin/env bash
# needs: git zsh

git clone https://github.com/kaineer/tmux-config.git ~/git/config/tmux >/dev/null 2>/dev/null

if [[ "$?" != "0" ]]; then
  exit 1
else
  TMUX_CONF_FILE="$HOME/.tmux.conf"

  echo "TMUX_CFG=$HOME/git/config/tmux" > $TMUX_CONF_FILE
  echo "source \$TMUX_CFG/config.conf"   >> $TMUX_CONF_FILE
fi
