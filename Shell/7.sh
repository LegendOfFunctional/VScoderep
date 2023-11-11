#!/bin/bash

# Check if the arguments were given
if [ $# -ne 2 ]
  then
    echo "Incorrect number of arguments. Please provide both a filename and a word."
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]
  then
    echo "The file $1 does not exist."
    exit 1
fi

# Count and print the number of lines starting with the given word
count=$(grep -c "^$2" $1)
echo "The number of lines in $1 starting with $2 is: $count"


