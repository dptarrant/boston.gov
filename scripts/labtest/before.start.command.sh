#! /bin/bash -e

# Runs at the end of the labtest process.

cd docroot

#-> Make a space separated list of modules to enable here
EN_MODULES="labtest"
#-> Make a space separated list of modules to disable here
DIS_MODULES="acquia_purge"

drush en $MODULES -y

drush dis $DIS_MODULES -y

#-> Run any hook updates
drush updb -y

#-> Reset the admin password for this experiement
drush uli