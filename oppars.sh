#!/bin/bash
#sequence of numbers task
#use example
# -d for debug -o <OPERATOR> -n <NUMBER NUMBER NUMBER ...>

print_debug_info() {
  echo "User: $USER"
  echo "Script: $0"
  echo "Operation: $operator"
  echo "Numbers: ${#numbers[@]}"
}
debug=0
while getopts "o:n:d" flag;
do
    case "${flag}" in
        o) 
            operator=${OPTARG} 
            
            ;;
        d) 
            debug=1 
            
            ;;
        n)
            numbers=()
            shift $((OPTIND - 2))
            while [[ $# -gt 0 ]] && [[ $1 != -* ]]; do
                numbers+=("$1")
                shift
            done
            ;;
        
    esac
done

if [ $debug -eq 1 ]; then
    print_debug_info
fi  

result=${numbers[0]}
case $operator in
  -)
    for ((i = 1; i < ${#numbers[@]}; i++)); do
      result=$((result - numbers[i]))
    done
    ;;
  +)
    for ((i = 1; i < ${#numbers[@]}; i++)); do
      result=$((result + numbers[i]))
    done
    ;;
  \*)
    for ((i = 1; i < ${#numbers[@]}; i++)); do
      result=$((result * numbers[i]))
    done
    ;;
  %)
    for ((i = 1; i < ${#numbers[@]}; i++)); do
      result=$((result % numbers[i]))
    done
    ;;

esac

echo "The ressult is : $result"