#!/bin/bash

for log in *.BIN
do
	mavextract.py --mode AUTO $log
	mkdir $log.ex
	mv AUTO* $log.ex
done
