#!/usr/bin/env bash

if [[ -f ~/.nvm/nvm.sh ]]; then
  echo " > Found ~/.nvm/nvm.sh script"
  exit 0
else
  echo " > Did not found ~/.nvm/nvm.sh script"
  exit 1
fi
