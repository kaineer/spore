#!/usr/bin/env bash

PATTERN="# loading aliases"

ALIASES_DIR=false
SHELL_RC=true

if [[ -d ~/bin/aliases ]]; then
  ALIASES_DIR=true
fi

if [[ "$(which zsh)" != "" ]]; then
  if [[ "$(cat ~/.zshrc | grep "$PATTERN" | wc -l)" == "0" ]]; then
    SHELL_RC=false
  fi
fi

if [[ "$(which bash)" != "" ]]; then
  if [[ "$(cat ~/.bashrc | grep "$PATTERN" | wc -l)" == "0" ]]; then
    SHELL_RC=false
  fi
fi

if [[ "$ALIASES_DIR:$SHELL_RC" == "true:true" ]]; then
  exit 0
else
  exit 1
fi
