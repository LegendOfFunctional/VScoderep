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

# Remove 3 digits long numbers from the file
sed -i '/\b[0-9]\{3\}\b/d' $1

