#!/bin/bash
#implementation of task 5

while getopts ":vrIUi:o:" arg; do
  case ${arg} in
    v)    
        UPTOLOWER=1
    ;;

    r)
        REVERSE=1
    ;;

    I)
        ALLTOLOWER=1
    ;;

    u)
        ALLTOUPPER=1
    ;;

    i)

        INPUTFILE=$OPTARG
        ;;
    o)
        OUTPUTFILE=$OPTARG
        ;;

  esac
done