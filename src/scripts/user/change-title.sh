#!/bin/bash
USER="$1"
TITLE="$2"

HOME="/home/$USER"

echo "$TITLE" > "$HOME/.nineteen/title"
