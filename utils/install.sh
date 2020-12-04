#!/usr/bin/env bash

DEPENDENCY=$1

echo " > Installing $DEPENDENCY"

DEPENDENCY_CHAIN=$(cat ./.dependency_chain)

for PLATFORM in $(echo $DEPENDENCY_CHAIN); do
  FILE="dependencies/$PLATFORM/$DEPENDENCY.sh"
  if [[ -f $FILE ]]; then
    echo " > Found «$FILE» for installing «$DEPENDENCY»"
    echo " > Checking subdependencies..."

    NEEDS=$(cat $FILE | grep needs: | sed 's/.*needs: //')
    for PART in $(echo $NEEDS); do
      echo " > Looks like «$DEPENDENCY» needs «$PART»"
      echo " > I will try to install it"
      utils/spore.sh $PART
      if [[ "$?" != "0" ]]; then
        echo " > Could not install «$PART» for «$DEPENDENCY»"
        exit 1
      fi
    done

    echo ' > done with subdependencies for $DEPENDENCY.'

    source $FILE
    if [[ "$?" == "0" ]]; then
      echo " > done."
      echo " > «$DEPENDENCY» is installed, yay!"
      exit 0
    else
      echo " ! failed."
    fi
  fi
done

echo " ! Did not install «$DEPENDENCY»"
exit 1
