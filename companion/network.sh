#!/bin/bash

#telstra link
ifconfig enx364b50b7ef2d 192.168.0.182/24 up
(route -n | grep 54.206.123.106) || route add -host 54.206.123.106 gw 192.168.0.1


#optus link
ifconfig enx0c5b8f279a64 192.168.8.100/24 up
(route -n | grep 54.206.13.6) || route add -host 54.206.13.6 gw 192.168.8.1

#default route
(route -n | grep 0.0.0.0) || route add default gw 192.168.0.182

