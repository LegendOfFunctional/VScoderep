#!/bin/bash

# Check if two arguments were given
if [ $# -ne 2 ]
  then
    echo "Incorrect number of arguments. Please provide two numbers."
    exit 1
fi

gcd () {
  if [ $2 -eq 0 ]; then 
    echo $1
  else 
    gcd $2 $(($1 % $2))
  fi
}

result="$(gcd $1 $2)"
echo "The greatest common divisor of $1 and $2 is: $result"

