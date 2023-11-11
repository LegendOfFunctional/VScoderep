#!/bin/bash

# Check if the argument was given
if [ $# -ne 1 ]
  then
    echo "Missed argument: Please supply a filename as an argument."
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]
  then
    echo "The file $1 does not exist."
    exit 1
fi

# Print the odd lines of the file
awk 'NR % 2 == 1' $1

