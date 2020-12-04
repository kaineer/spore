#!/usr/bin/env bash

if [[ "$1" == "plant" ]]; then
  SPORE_BIN="$(pwd)/$(basename $0)"
  cd ~/bin
  if [[ -f spore ]]; then
    echo ' » Spore already planted'
  else
    echo ' » Planting spore into ~/bin'
    ln -s $SPORE_BIN spore
    echo ' » done.'
  fi
  cd - >/dev/null
elif [[ "$1" == "remove" ]]; then
  echo ' » Removing spore from system'
  rm ~/bin/spore
  echo ' » done.'
elif [[ "$1" == "update" ]]; then
  SPORE_BIN=$(readlink -f $0)
  SPORE_DIR=$(dirname $SPORE_BIN)

  cd $SPORE_DIR
  git pull origin master
  cd - >/dev/null
else
  SPORE_BIN=$(readlink -f $0)
  SPORE_DIR=$(dirname $SPORE_BIN)

  cd $SPORE_DIR
  utils/spore.sh $*
  cd - >/dev/null
fi
