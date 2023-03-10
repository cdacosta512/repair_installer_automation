# Automated repair install <Linux>

What do we want this script to do:

# Name of the Installer with r7 name in it
# Disclamer before using the tool -- only directed by support
# Stop the service -- confirm the service and DB service is stopped

#### do a find on common file (nxpdata) and confirm if that file exist ####
sudo find / -iname 'nxpdata'          #  /opt/rapid7/nexpose/nsc/nxpgsql/nxpdata                               # If it does not then quit script

# Once this is found add user validation that the directory is correct
- Anything that is not y or Y then end script


# Set anything before /nsc will be set as a $path variable (/opt/rapid7/nexpose/)
- run a test against a box that does not use the default directory
- what if we find multiple version of nxpdata  # stop the script

# rename the <installation directory>/plugins directory by renaming it to plugins.bak
# rename the <installation directory>/nsc/conf/userdb.xml file by making a copy  and naming the copy userdb.xml.bak
## Check the userdb file and move it out of the path of the nexpose directory (tmp folder)
# delete the <installation directory>/updates/pending/ and the <installation directory>/updates/stagingFileData folders and their contents
# Download the latest InsightVM installer and add execution permissions to it.
# Change the permissions on the installer
# Run the installer
- Did it it detect if 

# Ask the user do they want to continue with the repair install
# Let the repair install weird run
# Automatically install run through the wizard


# create a customer directory
# delete the dir at the end for clean
# 

