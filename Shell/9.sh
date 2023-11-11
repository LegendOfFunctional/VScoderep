#!/bin/bash

# Check if the argument was given
if [ $# -ne 1 ] 
  then
    echo "Please provide a single number as an argument."
    exit 1
fi

# Create the string to print
string_to_print=""
for (( c=1; c<=$1; c++ ))
do
   string_to_print+="A"
done

# Print it out line by line
for (( l=1; l<=$1; l++ ))
do
   echo $string_to_print
done

