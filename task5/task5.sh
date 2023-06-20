#!/bin/bash
#implementation of task 5

#uses input.txt file to pass text -i inputfile.txt

#-v to change lowercase to upper and vice versa
#-r to reversse the order of lines in a file
#-I all characters are tranformed to lower
#-u all characters are tranformed to uper
#-s <A_WORD> <B_WORD> to replace a word with b word

#use example
#./task5.sh -i <INPUTFILE> -o <OUTPUTFILE> -s <A_WORD> <B_WORD>
 


UPTOLOWER=0
REVERSE=0
ALLTOLOWER=0
ALLTOUPPER=0
STRINGARGS=0

upToLower() {
    transformed=$(echo "$TEXT" | tr '[:lower:][:upper:]' '[:upper:][:lower:]')
}
toUpper() {
    transformed=$(echo "$TEXT" | tr '[:lower:]' '[:upper:]')
}

toLower() {
    transformed=$(echo "$TEXT" | tr '[:upper:]' '[:lower:]')
}
reversed() {
    transformed=$(echo "$TEXT" | tac ) # "brew install coreutils" needed to work
}

substitute () {
    transformed=$(echo "$TEXT" | sed "s/${words[0]}/${words[1]}/g") # sed s for substitute s/<A-WORD>/<B-WORD>/g for global
}

while getopts ":vrIui:o:s:" arg; do
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
    s)
        STRINGARGS=1
        ;;

  esac
done

shift $(( OPTIND - 2 ))
word=("")

if [[ -f $INPUTFILE ]]; then
  TEXT=$(<"$INPUTFILE")  
else
    echo "No imput file"
    exit 1
fi

if [[ $STRINGARGS -eq "1" ]]; then # Adding Switch words of -s parameter to array "words"
    for word in "$@"; do
        words=(${words[@]} $word)
    done

fi

if [[ ${#words[@]} -gt 2 ]]; then # if more than 2 words passed abort
    echo "Invalid arguments"
    exit 1
elif [[ $STRINGARGS -eq "1" ]]; then
    substitute
fi

if [[ $UPTOLOWER -eq "1" ]]; then
    upToLower
fi

if [[ $ALLTOLOWER -eq "1" ]]; then
    toLower
fi

if [[ $ALLTOUPPER -eq "1" ]]; then
    toUpper
fi
if [[ $REVERSE -eq "1" ]]; then
    reversed
fi
if [[ -f $OUTPUTFILE ]]; then
    echo "$transformed" > $OUTPUTFILE
else 
    echo "No outputfile"
    exit 1
fi

