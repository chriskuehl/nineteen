#!/bin/sh
USER="$1"
TITLE="$2"

HOME="/home/$USER"

echo "$2" > "$HOME/.nineteen/mysql-password"
