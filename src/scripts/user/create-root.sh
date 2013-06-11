#!/bin/bash

# create home roots
HOME="/home/$1"
mkdir -p "$HOME/logs/www/$2/"
mkdir -p "$HOME/www/$2/public/"

# set proper permissions
chown -R $1:design19 "$HOME/logs/www/$2/"
chown -R $1:design19 "$HOME/www/$2/"

/srv/nineteen/bin/user/set-acl.sh $1 $HOME

# all done
echo "OK"
