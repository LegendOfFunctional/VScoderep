#!/bin/bash

if [ $# -eq 0 ]
	then
		echo "no arg given, enter arg:"
		read P
	else
		P=$1

fi

RESULT=$((5*P*P + 3*P+1))

echo "arg is $P and result is $RESULT"

