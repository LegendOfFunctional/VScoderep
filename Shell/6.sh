#!/bin/bash

# Check if the arguments were given
if [ $# -ne 3 ]
  then
    echo "No arguments or incorrect number of arguments supplied. Please enter the three numbers:"
    read -p "First number: " num1
    read -p "Second number: " num2
    read -p "Third number: " num3
  else
    num1=$1
    num2=$2
    num3=$3
fi
# sort the numbers
echo -e "$num1\n$num2\n$num3" | sort -n


