# RAPID7 INSTALLER SCRIPT
#!/bin/bash

echo "Rapid7 Repair Install Tool"
sleep 1
echo ""
echo "Disclaimer: This tool should only be ran per the instructions of Rapid7 Support."
sleep 3
echo ""
echo "Starting the Rapid7 Repair Install Tool now..."
sleep 2



# Fills the time for when the find command runs
echo "Looking for older version of Rapid7 Installer. Please wait..."

# Ask the customer to run as sudo
file=$(sudo find / -iname Rapid7* | grep "Rapid7Setup-Linux64.bin")

# Checks if the results of the find command contain the Rapid7Setup-Linux64.bin file
if [ -f $file == *"/Rapid7Setup-Linux64.bin"  ]
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