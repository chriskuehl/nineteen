#!/bin/bash
source /srv/nineteen/bin/mysql/key.sh

# change pass
echo "SET PASSWORD FOR '$1'@'localhost' = PASSWORD('$2')" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD

# all done
echo "OK"
