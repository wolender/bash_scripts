#!/bin/bash
#sequence of numbers task

print_debug_info() {
  echo "User: $USER"
  echo "Script: $0"
  echo "Operation: $operator"
  echo "Numbers: ${numbers[*]}"
}
debug=0
while getopts "o:n:d" flag;
do
    case "${flag}" in
        o) operator=${OPTARG} ;;
        n) numbers=${OPTARG[@]} ;;
        d) debug=1 ;;
    esac
done

if [ $debug -eq 1 ]; then
    print_debug_info
fi  
    