#!/usr/bin/env bash

DEPENDENCY=$1

echo " > Installing $DEPENDENCY"

DEPENDENCY_CHAIN=$(cat ./.dependency_chain)

INSTALLED=false

for PLATFORM in $(echo $DEPENDENCY_CHAIN); do
  FILE="dependencies/$PLATFORM/$DEPENDENCY.sh"
  if [[ -f $FILE ]]; then
    echo " > Found «$FILE» for installing «$DEPENDENCY»"
    echo " > Going to run it..."
    source $FILE
    if [[ "$?" == "0" ]]; then
      echo " > done."
      echo " > «$DEPENDENCY» is installed, yay!"
      INSTALLED=true
      exit 0
    else
      echo " ! failed."
    fi
  else
    echo " > Did not found «$FILE»..."
  fi
done

echo " ! Did not install «$DEPENDENCY»"
exit 1
