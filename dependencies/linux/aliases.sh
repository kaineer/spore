#!/usr/bin/env bash

PATTERN="# loading aliases"

install_aliases_loading() {
  FILE=$1

  echo "$PATTERN"                          >>$FILE
  echo "if [[ -f ~/bin/aliases ]]; then"   >>$FILE
  echo "  cd ~/bin/aliases"                >>$FILE
  echo "  for ALIAS_FILE in \$(ls -1); do" >>$FILE
  echo "    source \$ALIAS_FILE"           >>$FILE
  echo "  done"                            >>$FILE
  echo "  cd -"                            >>$FILE
  echo "fi"                                >>$FILE
}

if [[ "$(which zsh)" != "" ]]; then
  echo " > There is a zsh"
  if [[ "$(cat ~/.zshrc | grep "$PATTERN" | wc -l)" == "0" ]]; then
    echo " > Installing into zshrc"
    install_aliases_loading ~/.zshrc
  fi
fi

if [[ "$(which bash)" != "" ]]; then
  echo " > There is a bash"
  if [[ "$(cat ~/.bashrc | grep "$PATTERN" | wc -l)" == "0" ]]; then
    echo " > Installing into bashrc"
    install_aliases_loading ~/.bashrc
  fi
fi

mkdir -p ~/bin/aliases
