#!/bin/sh
#!/bin/sh
UNAME="$1"
DATESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

deluser "$1"

# propogate the delete to other servers
/srv/scripts/update-users.sh

mv "/home/$1" "/home/deleted-users/$1-$DATESTAMP"
