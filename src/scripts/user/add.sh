#!/bin/bash
USER="$1"
TITLE="$2"

HOME="/home/$USER"

# add the user
adduser --shell /usr/bin/zsh --disabled-password --gecos "" "$USER"

chown -R "$USER:$USER" "$HOME"
chmod 700 "$HOME"

# setup home directory folders
mkdir -p "$HOME/logs/www/"
mkdir -p "$HOME/www/"
mkdir -p "$HOME/tmp/"

# set up nineteen data
mkdir -p "$HOME/.nineteen"
chown -R root:root "$HOME/.nineteen"
chmod 700 "$HOME/.nineteen"
echo "$TITLE" > "$HOME/.nineteen/title"

# propogate the user to other servers
/srv/scripts/update-users.sh
