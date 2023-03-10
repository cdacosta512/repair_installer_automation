#!/bin/bash

echo "Looking for older version of Rapid7 Installer. Please wait..."

# Ask the customer to run as sudo
file=$(sudo find / -iname Rapid7* | grep "Rapid7Setup-Linux64.bin")


if [ -f $file ]
then
    echo "An older version of the Rapid7 Installer was found. Removing and downloading a fresh installer."
    sudo rm $file
    cd /tmp/
    wget https://download2.rapid7.com/download/InsightVM/Rapid7Setup-Linux64.bin
    echo "New installer has been downloaded."
else
    echo "Unable to find existing installer. Downloading installer now..."
    cd /tmp/
    wget https://download2.rapid7.com/download/InsightVM/Rapid7Setup-Linux64.bin
    echo "New installer has been downloaded."
fi