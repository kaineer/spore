#!/usr/bin/env bash

if [[ ! -f ./.dependency_chain ]]; then
  echo " > Detect current platform"

  DEPENDENCY_CHAIN=''

  if [[ "$(uname -s)" == "Linux" ]]; then
    if [[ "$(uname -a | grep 'Ubuntu' | wc -l)" == "1" ]]; then
      DEPENDENCY_CHAIN='ubuntu debian linux'
    elif [[ "$(uname -a | grep 'Debian' | wc -l)" == "1" ]]; then
      DEPENDENCY_CHAIN='debian linux'
    else
      DEPENDENCY_CHAIN='linux'
    fi
  fi

  echo " > Save current platform into .dependency_chain file"
  echo $DEPENDENCY_CHAIN>./.dependency_chain
else
  echo " > Platform detection is already performed"
fi
