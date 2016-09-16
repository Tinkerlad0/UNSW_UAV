#!/bin/bash
export FAKE_CHAMELEON=1

DEVICE=/dev/serial/by-id/$(ls /dev/serial/by-id/)

mavproxy.py --master $DEVICE --aircraft vtolTest
