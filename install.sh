#!/bin/bash

##Check if root user, we need this to be able to run pretty much everything here

if (( $EUID != 0 )); then
	echo "PLease run this script with root priveleges, ie with the sudo command"
	exit
fi

##Now make sure the the user is in te ome directory of their current user.
##We just check this manually by asking the user to confirm this.

echo "Please confirm that you have run this script from your home directory by typing 'Home'"

read confirmation

if (( $confirmation != "Home" )); then
	echo "You need to confirm that this is running from your home directory, try again"
	exit
fi

echo " "
echo "Thank you for coming this far, now just sit back and enjoy the ride"
echo "Unless something goes wrong...... Then its your job to fix it"

apt-get install -y python-dev python-opencv python-wxgtk3.0 python-pip python-matplotlib python-pygame pyton-lxml

pip install MAVProxy

adduser $USER dialout
