#!/usr/bin/env bash

DEPENDENCY=$1

echo " > Installing $DEPENDENCY"

DEPENDENCY_CHAIN=$(cat ./.dependency_chain)

INSTALLED=false

NEEDS=$(cat dependencies/linux/nvm.sh | grep needs: | sed 's/.*needs: //')

for PART in $(echo $NEED); do
  echo " > Looks like «$DEPENDENCY» needs «$PART»"
  echo " > I will try to install it"
  utils/install.sh $PART
  if [[ "$?" != "0" ]]; then
    echo " > Could not install «$PART» for «$DEPENDENCY»"
    exit 1
  fi
done

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
    echo " ? Did not found «$FILE»..."
  fi
done

echo " ! Did not install «$DEPENDENCY»"
exit 1
