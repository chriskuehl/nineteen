#!/bin/sh
USER="$1"
HOME="/home/$USER"
NT="$HOME/.nineteen"

ls "$NT/domains/" |
while read DOMAIN; do
	echo "$DOMAIN"
done
