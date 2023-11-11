#!/bin/bash

# Check if the argument was given
if [ $# -eq 0 ] 
  then
    echo "No arguments supplied. Please enter a number:"
    read N
  else
    N=$1
fi

# Initialize the first element and step
first_element=3
step=4

# Calculate and print the series
current_element=$first_element
for (( i=1; i<=$N; i++ ))
do
   echo $current_element
   current_element=$((current_element+step)) 
done

