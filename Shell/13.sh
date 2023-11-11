#!/bin/bash

# Check if arguments were given
if [ $# -ne 2 ]
  then
    echo "Please provide two arguments: filename and a name."
    exit 1
fi

# Check if the file exists
if [ ! -f $1 ]
  then
    echo "The file $1 does not exist."
    exit 1
fi

grep "^$2" $1

