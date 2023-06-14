#!/bin/bash
#sequence of numbers task

while getopts o:n:d flag
do
    case "${flag}" in
        o) operator=${OPTARG};;
        n) numbers=${OPTARG[@]};;
        d) debug=1;;
    esac
done
    