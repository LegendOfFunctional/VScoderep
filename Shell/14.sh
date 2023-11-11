#!/bin/bash

# Check if the argument was given
if [ $# -eq 0 ] 
then
    echo "No arguments supplied. Please enter a number:"
    read num
else
    num=$1
fi

# Print the top of the square
printf 'A%.0s' $(seq 1 $num)
echo

# Print the middle portion of the square
for (( c=2; c<$num; c++ ))
do
   echo "A"" "$(printf ' %.0s' $(seq 3 $((num-1))))"A"
done

# Print the bottom of the square
printf 'A%.0s' $(seq 1 $num)
echo

