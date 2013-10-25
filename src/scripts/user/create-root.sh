#!/bin/bash

# create home roots
HOME="/home/$1"
mkdir -p "$HOME/log/www/$2/"
mkdir -p "$HOME/www/$2/public/"

# set proper permissions
chown -R $1:design19 "$HOME/log/www/$2/"
chown -R $1:design19 "$HOME/www/$2/"

# all done
echo "OK"
