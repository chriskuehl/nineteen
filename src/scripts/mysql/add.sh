#!/bin/bash
source /srv/nineteen/bin/mysql/key.sh

# create user
echo "GRANT USAGE ON *.* TO '$1'@'localhost' IDENTIFIED BY 'unset' \
WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 \
MAX_USER_CONNECTIONS 0 ;" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD

# give it wildcard rights
echo "GRANT ALL PRIVILEGES ON \`$1\_%\`.* TO '$1'@'localhost';" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD

# all done
echo "OK"
