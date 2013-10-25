#!/bin/sh
USER="$1"
HOME="/home/$USER"
NT="$HOME/.nineteen"

du -bs "$HOME" | cut -f1 > "$NT/cached-disk-space"
echo "0" > "$NT/cached-mysql-space"
