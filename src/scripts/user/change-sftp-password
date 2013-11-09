#!/bin/bash
USER="$1"
PASSWORD="$2"

HOME="/home/$USER"

echo "$PASSWORD" > "$HOME/.nineteen/sftp-password"
echo "$USER:$PASSWORD" | chpasswd

# propogate the user to other servers
/srv/scripts/update-users.sh
