#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "no arg given... exiting..."
		exit 1

fi

case $1 in
	-g)
		echo "hello"
		;;
	-l)
		echo "dir"
		ls
		;;
	-w)
		echo "who?"
		who
		;;
	-?)
		echo "-g for hello, -l for dir, -w for owl"
esac
