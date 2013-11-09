#!/bin/bash
USER="$1"
DOMAIN="$2"
HOME="/home/$USER"
NT="$HOME/.nineteen"
DD="$NT/domains/$DOMAIN"

function zeroCat() {
	if [ -f "$1" ]; then
		cat "$1"
	else
		echo "0"
	fi
}

zeroCat "$DD/root"
zeroCat "$DD/www"
zeroCat "$DD/serial"
zeroCat "$DD/auth"
