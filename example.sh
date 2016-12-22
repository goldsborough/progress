#!/usr/bin/env zsh

PROGRESS_STICKY=yes
PROGRESS_WIDTH=80
PROGRESS_NUMBER_OF_STEPS=${1:-10}
source progress.sh

for i in $(seq $PROGRESS_NUMBER_OF_STEPS); do
  echo $i
  sleep .05
  progress_step
done
