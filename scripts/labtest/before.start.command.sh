#! /bin/bash -e

# Runs at the end of the labtest create/update process, before the container is started.
# NOTE: NEED TO USE -v OPTION IN  LABTEST COMMAND TO SEE ANY OUTPUT FROM THIS SCRIPT..

#-> For drush commands, switch to the docroot.
cd docroot

#-> Make a space separated list of modules to enable here.
#   NOTE: modules already enabled will remain enabled.
EN_MODULES="labtest"
#-> Make a space separated list of modules to disable here.
#   NOTE: modules already disabled will remain disabled.
DIS_MODULES="acquia_purge"

#-> Enable and disable required modules, aS specified above.
if [ $EN_MODULES ]; then
    drush en $MODULES -y
fi
if [ $DIS_MODULES ]; then
    drush dis $DIS_MODULES -y
fi

#-> Run any hook updates.
drush updb -y

##################################
# Add specific commands here
#---------------------------------

##################################

#-> [Optional] reset the admin password for this experiment.
# drush upwd admin --password="admin" -y

#-> Finally, login the admin user and provide a link back to the cli/console.
GREEN="\033[0;32m"
echo -e "${GREEN}Experiment login for User 1"
drush uli
