#!/bin/bash
PROGRESS_NUMBER_OF_STEPS=10
source progress.sh

for i in $(seq 10); do
  echo $i
  sleep .1
  progress_step
done