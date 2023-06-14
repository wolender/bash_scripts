#!/bin/bash

while true; do 
    echo "give a number: or END"
    read NUMBER
    if [ NUMBER -eq "END" ] 
        then
            break
    fi
done


COUNT=0
for serv in ${SERVLIST[@]} ; do
    echo "this is : ${SERVLIST[COUNT]} "
    COUNT=`expr $COUNT + 1`
done