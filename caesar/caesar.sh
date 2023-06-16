#!/bin/bash

while getopts ":s:i:o:" arg; do
  case ${arg} in
    s)    
        SHIFT=$OPTARG
    ;;

    i)
        INPUTFILE=$OPTARG
    ;;

    o)
        OUTPUTFILE=$OPTARG
    ;;

  esac
done

caesarEncrypt (){

  for ((i = 0 ; i <= ${#TEXT}; i++)); do
    echo ${TEXT:i:1}
  done

}

if [[ -f $INPUTFILE ]]; then
  TEXT=$(<"$INPUTFILE")  
else
  echo "Input file not found."
  exit 1
fi

caesarEncrypt
