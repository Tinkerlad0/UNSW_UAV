#!/bin/bash

##Check if root user, we need this to be able to run pretty much everything here

if (( $EUID != 0 )); then
	echo "PLease run this script with root priveleges, ie with the sudo command"
	exit
fi

echo " "
echo "Thank you for coming this far, now just sit back and enjoy the ride"
echo "Unless something goes wrong...... Then its your job to fix it"

apt-get install -y python-dev python-opencv python-wxgtk3.0 python-pip python-matplotlib python-pygame pyton-lxml python-espeak python-empy
apt-get install -y ccache gawk python-decorator python-pexpect python-ptyprocess python-scipy
apt-get install -y pyserial
pip install pymavlink

## ensure in home directory
cd

##clone down and install mavproxy
git clone --recusive https://github.com/Dronecode/MAVProxy.git
cd mavproxy
python setup.py build install
cd

##clone down and install cuav
sudo apt-get install -y libusb-1.0.0-dev libdc1394-22-dev libopencv-dev python-pyexiv2 python-httplib2 libjpeg-turbo-progs
git clone https://github.com/tridge/cuav.git
cd cuav
python setup.py build install
cd

##clone down the ardupilot code, and sitl
git clone https://github.com/ArduPilot/ardupilot.git
git clone https://github.com/tridge/jsbsim.git
sudo apt-get install libtool automake autoconf libexpat1-dev
mkdir libtool_install
cd libtool_install
wget ftp://ftp.gnu.org/pub/gnu/libtool/libtool-2.4.6.tar.gz
tar -xzvf libtool-2.4.6.tar.gz
cd libtool-2.4.6
./configure
make
make install
cd
cd jsbsim
./autogen.sh --enable-libraries
make
make install
cd
echo 'export PATH=$PATH:$HOME/jsbsim/src' >> .bashrc
echo 'export PATH=$PATH:$HOME/ardupilot/Tools/autotest' >> .bashrc
echo 'export PATH=/usr/lib/ccache:$PATH' >> .bashrc

adduser $USER dialout
