#!/bin/bash
#The Fibonacci numbers 
fib() {
    local n=$1
    if [ "$n" -eq "0" ] ; then
        return 0
    
    elif [ "$n" -eq "1" ] ;then
        return 1
    
    else 
        local val1=0
        local val2=0

        fib `expr $n - 1`
        val1=$?
        
        fib `expr $n - 2`
        val2=$?

        return `expr $val1 + $val2`
    fi
}
echo "Please enter N number :"
read n
fib $n
echo $?
