#!/usr/bin/env bash

NEEDS=$(cat dependencies/linux/nvm.sh | grep needs: | sed 's/.*needs: //')

for N in $(echo $NEEDS); do
  echo " * $N"
done
