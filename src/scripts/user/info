#!/bin/bash
USER="$1"
HOME="/home/$USER"
NT="$HOME/.nineteen"

function zeroCat() {
	if [ -f "$1" ]; then
		cat "$1"
	else
		echo "0"
	fi
}

zeroCat "$NT/title"
zeroCat "$NT/mysql-password"
zeroCat "$NT/sftp-password"
zeroCat "$NT/cached-disk-space"
zeroCat "$NT/cached-mysql-space"
zeroCat "$NT/protected"
