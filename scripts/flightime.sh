#!/bin/bash

for log in *.bin*
do
	mavflighttime.py --groundspeed 0 $log > $log.time
done 
