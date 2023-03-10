# Automated repair install <Linux>

What do we want this script to do:

# Name of the Installer with r7 name in it
# Disclamer before using the tool -- only directed by support
# Check the nexpose servive
# Check the nxpgsql service 
# Stop the service -- confirm the service and DB service is stopped
# rename the <installation directory>/plugins directory by renaming it to plugins.bak
# rename the <installation directory>/nsc/conf/userdb.xml file by making a copy  and naming the copy userdb.xml.bak
## Check the userdb file and move it out of the path of the nexpose directory (tmp folder)
# delete the <installation directory>/updates/pending/ and the <installation directory>/updates/stagingFileData folders and their contents
# Download the latest InsightVM installer and add execution permissions to it.
# Change the permissions on the installer
# Run the installer
# Ask the user do they want to continue with the repair install
# Let the repair install weird run
# Automatically install run through the wizard


