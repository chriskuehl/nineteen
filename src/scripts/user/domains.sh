#!/bin/sh
USER="$1"
HOME="/home/$1"
NT="$HOME/.nineteen"

ls "$NT/domains/" |
while read DOMAIN; do
	echo "$DOMAIN"
done
