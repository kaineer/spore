#!/usr/bin/env bash

if [[ ! -f ./.platform || ! -f ./.dependency_chain ]]; then
  echo " > Detect current platform"

  PLATFORM='unknown'
  PLATFORM_CHAIN=''

  if [[ "$(uname -s)" == "Linux" ]]; then
    if [[ "$(uname -a | grep 'Ubuntu' | wc -l)" == "1" ]]; then
      PLATFORM='ubuntu'
      DEPENDENCY_CHAIN='ubuntu debian linux'
    fi
    if [[ "$PLATFORM" == "unknown" && "$(uname -a | grep 'Debian' | wc -l)" == "1" ]]; then
      PLATFORM='debian'
      DEPENDENCY_CHAIN='debian linux'
    fi
    if [[ "$PLATFORM" == "unknown" ]]; then
      PLATFORM='linux'
      DEPENDENCY_CHAIN='linux'
    fi
  fi

  echo " > Save current platform into .platform and .dependency_chain files"
  echo $PLATFORM >./.platform
  echo $DEPENDENCY_CHAIN>./.dependency_chain
else
  echo " > Platform detection is already performed"
fi
