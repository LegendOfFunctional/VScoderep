#!/bin/bash

# Check if a pair of arguments was given
if [ $# -ne 2 ]
  then
    echo "You must supply two integers as arguments."
    exit 1
fi

# Process arguments and make sure they are in increasing order
if (( $1 > $2 ))
  then
    temp=$1
    first=$2
    second=$temp
  else
    first=$1
    second=$2
fi

for (( i=first; i<=second; i++ ))
do
    square=$((i*i))
    if (( square >= first && square <= second ))
      then
      echo $square
    fi
done

