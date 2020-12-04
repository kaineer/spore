#!/usr/bin/env bash

#
# Check if dependency already planted
#   Then exit
# Else:
#   Look for dependencies in meta/$1.ls file
#   For each such dependency
#     Run utils/spore.sh $DEPENDENCY
#   At last find dependencies/$CHAIN_ITEM/$1.sh file
#     And run it
#

DEPENDENCY=$1

PLANTED=false

if [[ -f "planted/$DEPENDENCY.sh" ]]; then
  planted/$DEPENDENCY.sh
  if [[ "$?" == "0" ]]; then
    PLANTED=true
  fi
else
  FOUND_ITEM=$(which $DEPENDENCY)
  if [[ "$FOUND_ITEM" != "" ]]; then
    PLANTED=true
  fi
fi

if [[ "$PLANTED" == "false" ]]; then
  echo " > Dependency «$DEPENDENCY» is not installed"
  echo " > Let us try to install it, though"

  utils/detection.sh
  utils/install.sh $DEPENDENCY
else
  echo " > Dependency «$DEPENDENCY» is already installed"
fi
