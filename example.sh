#!/usr/bin/env zsh

PROGRESS_STICKY=yes
PROGRESS_NUMBER_OF_STEPS=${1:-10}
source progress.sh

for i in $(seq $PROGRESS_NUMBER_OF_STEPS); do
  echo $i
  sleep .01
  progress_step
done
