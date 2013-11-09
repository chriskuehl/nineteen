#!/bin/bash
/srv/nineteen/bin/bind/template.sh $1 $2 > /etc/bind/zones/$1
/srv/nineteen/bin/bind/update-local.sh

curl "https://api.linode.com/\
?api_key=API_KEY_REDACTED\
&api_action=domain.create\
&Domain=$1\
&Type=slave\
&master_ips=50.116.10.104" > api.txt
