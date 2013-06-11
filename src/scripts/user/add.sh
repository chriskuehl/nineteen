#!/bin/bash

# add the user
adduser --disabled-password --gecos "$1,,," $1

# setup home directory folders
HOME="/home/$1"
mkdir -p "$HOME/logs/www/"
mkdir -p "$HOME/www/"
mkdir -p "$HOME/tmp/"

# set permissions on the home directory folders
chown -R $1:$1 $HOME
#chmod -R 770 $HOME
#chmod -R g+s $HOME

#usermod -a -G $1 www-data
#usermod -a -G $1 chris
#usermod -a -G $1 arian

# setup ACL on the home directory
#setfacl -Rm \
#d:group:design19:rwx,d:user:www-data:r-x,d:user:$1:rwx,d:group:$1:rwx,\
#group:design19:rwx,user:www-data:r-x,user:$1:rwx,group:$1:rwx $HOME

/srv/nineteen/bin/user/set-acl.sh $1 $HOME

# setup fastcgi
mkdir /var/www/fastcgi/$1/
cp /var/www/fastcgi/php5-fcgi /var/www/fastcgi/$1/
chown -R $1:$1 /var/www/fastcgi/$1/

# all done
echo "OK"
