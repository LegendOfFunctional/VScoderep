#!/bin/bash

if [ $# -ne 3 ]
    then
        echo "Please provide three arguments: filename, word to be replaced, and replacement word."
        exit 1
fi

if [ ! -f $1 ]
    then
        echo "The file $1 does not exist."
        exit 1
fi

filename=$1
old_word=$2
new_word=$3

# use the -i flag for replacement in the same file
# use ^ to target the start of each line
# use $ to target the end of each line
sed -i -e "s/^$old_word\>/$new_word/g" -e "s/\<$old_word$/$new_word/g" "$filename"

