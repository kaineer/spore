#!/usr/bin/env bash

NVM_VERSION="0.37.2"
NVM_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh"

if [[ "$(which curl)" != "" ]]; then
  echo " > Installing nvm using curl"
  curl -o- $NVM_URL | bash
elif [[ "$(which wget)" != "" ]]; then
  echo " > Installing nvm using wget"
  wget -qO- $NVM_URL | bash
else
  echo " ! Could not find curl or wget"
  exit 1
fi