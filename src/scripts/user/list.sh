#!/bin/sh
ls /home/ |
while read USER; do
	if [ "$USER" != "deleted-users" ]; then
		echo $USER
	fi
done
