#!/bin/bash

# RAPID7 INSTALLER SCRIPT


# Ask the customer to run as sudo
if [ $USER != "root" ]
then 
    echo "WARNING: Please elevate to root user / 'sudo su' then rerun script."
    exit 1
else
    echo "==> Running script as root"
fi

# Setting install directory
echo "Did you install Rapid7 in the default diretory? (y/N) "
read directory_answer

if [$directory_answer != "y"]
then
    echo "What directory is Rapid7 installed in: (format: /my/directory)"
    read set_directory




###########################################
# Checking to see if the service is running
###########################################

echo "==> Checking the status of the nexpose service"
sleep 2

service_name="nexposeconsole"
nexpose_srv="Nexpose"

# If the service is running it will let the user know and attempt to shut it down 

if systemctl is-active --quiet "$service_name.service" ; then                       # Review
  echo "==> $nexpose_srv is running"
  sleep 2
  echo "==> Attempting to shutdown the nexpose service in prep for the repair install..."
  sudo systemctl stop $service_name.service
  echo "==> $nexpose_srv is now stopped"
  echo "Continuing the repair install process"
else
  echo "==> $nexpose_srv is not running"
  sleep 2
  echo "==> Continuing the repair install process"
fi


#######################################################
# Checking for older installers and downloading new one
#######################################################

# Fills the time for when the find command runs
echo "Looking for older version of Rapid7 Installer. Please wait..."                                         # Add loading animation here to pass time 

# Ask the customer to run as sudo
file=$(sudo find / -iname 'Rapid7*' | grep --include=bin.* "Rapid7Setup-Linux64.bin\|Rapid7Setup-Linux64.bin.*")

# Checks if the results of the find command contain the Rapid7Setup-Linux64.bin file
if [ -f $file == *"/Rapid7Setup-Linux64.bin" ]
then
    echo "==> An older version of the Rapid7 Installer was found. Removing and downloading a fresh installer."
    sudo rm $file
                                                                                              # Delete older installer found
    cd /tmp/
    wget https://download2.rapid7.com/download/InsightVM/Rapid7Setup-Linux64.bin
    echo "==> New installer has been downloaded."
else
    echo "==> Unable to find existing installer. Downloading installer now..."
    cd /tmp/
    wget https://download2.rapid7.com/download/InsightVM/Rapid7Setup-Linux64.bin
    chmod +x /tmp/Rapid7Setup-Linux64.bin                                                                   # add execution permissions to it.
    echo "==> New installer has been downloaded."
fi


#######################################################
#                     Backup process
#######################################################

