#!/bin/sh
USER="$1"
HOME="/home/$USER"
NT="$HOME/.nineteen"

cat "$NT/title"
cat "$NT/mysql-password"
cat "$NT/cached-disk-space"
cat "$NT/cached-mysql-space"
