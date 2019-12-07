#!/bin/bash

# Need to add flags and capability for running R scripts and monitoring GPU usage(nvidia-smi)

while getopts 'r:p:g' OPTION; do
  case "$OPTION" in
    r)
      echo "Add R-Script Logic here"
      ;;
    p)
      nohup powerstat -R -z -H 1 380 >./power.log &
      pid=$!
      time /usr/local/bin/python3 $OPTARG
      kill $pid	
      wait $!
      ;;
    t)
      head -n 4 ./power.log
      tail -n 11 ./power.log
      ;;
    g)
      echo "ADD GPU TRACKING LOGIC HERE"
      ;;
    ?)
      echo "script usage: $(basename $0) [-p python_script.py] [-r r_script.r] [-a]" >&2
      exit 1
      ;;
  esac
done


