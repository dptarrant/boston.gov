#! /bin/bash -e

# Runs at the end of the labtest process.

cd docroot
#-> Make a space separated list of modules to enable here
MODULES="labtest"

drush en $MODULES -y

#-> Run any hook updates
drush updb -y

#-> Reset the admin password for this experiement
drush upwd admin --password="admin" -y