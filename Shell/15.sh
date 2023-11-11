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

# Sum the numbers and print the total
total=0
while read -r word1 number word2
do
  total=$((total + number))
done < $1
echo "The total sum of the numbers is $total"

