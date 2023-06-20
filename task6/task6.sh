#!/bin/bash

TEXT=""
OUTPUTFILE=output.txt

echo "" > $OUTPUTFILE #clear existing file

echo "Curent date is: `date` " >> $OUTPUTFILE

echo "Curent user: `whoami` " >> $OUTPUTFILE

echo "internal IP address is: `ifconfig en0 | grep -Eo 'inet \b(?:\d{1,3}\.){3}\d{1,3}\b'`  " >> $OUTPUTFILE

echo "Hostname: `hostname`"  >> $OUTPUTFILE

echo "System uptime: `uptime` " >> $OUTPUTFILE

echo "System `top -l 1 -s 0 | grep PhysMem` " >> $OUTPUTFILE
