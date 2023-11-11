#!/bin/bash

# Check if the argument was given
if [ $# -eq 0 ] 
  then
    echo "No arguments supplied. Please enter a number:"
    read N
  else
    N=$1
fi

# Calculate Nth even number
result=$((2*N))

# Print the result
echo "The $N-th even number is: $result"

