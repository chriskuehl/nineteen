#!/bin/sh
USER="$1"
PASSWORD="$2"

HOME="/home/$USER"

echo "$PASSWORD" > "$HOME/.nineteen/mysql-password"
