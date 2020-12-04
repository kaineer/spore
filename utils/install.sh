#!/usr/bin/env bash

DEPENDENCY=$1

echo " > Installing $DEPENDENCY"

DEPENDENCY_CHAIN=$(cat ./.dependency_chain)

INSTALLED=false

for PLATFORM in $(echo $DEPENDENCY_CHAIN); do
  FILE="dependencies/$PLATFORM/$DEPENDENCY.sh"
  if [[ -f $FILE ]]; then
    echo " > Found $FILE for installing $DEPENDENCY"
    echo " > Going to run it..."
    source $FILE
    echo " > done."
    if [[ "$?" == "0" ]]; then
      INSTALLED=true
    fi
  else
    echo " > Did not found $FILE..."
  fi
done
