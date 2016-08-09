#!/bin/bash

mkdir vtol
mkdir mugin

#look at the bin files first
for bin in *.BIN
do
	mavparms.py $bin | grep Q_ENABLE | grep 1
	if [ $? -eq 0 ]
	then
		mv $bin vtol/
	else
		mv $bin mugin/
	fi
done
