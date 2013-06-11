#!/bin/bash
DOMAIN=$1
SERIAL=$2
IP=50.116.10.104

echo "\$ttl 5m"
echo ""
echo "; SOA record"
echo "$1.   IN SOA  ns.d19.me.    hostmaster.$DOMAIN. ("
echo "                $SERIAL	; serial"
echo "                10800		; refresh (3 hours)"
echo "                3600		; retry (1 hour)"
echo "                604800		; expire (1 week)"
echo "                60		; minimum (1 minute)"
echo "                )"
echo "		IN      NS      ns.d19.me."
echo ""
echo "; main"
echo "@		IN A	$IP"
echo "www		IN CNAME	@"
echo ""
echo "ns		IN A	$IP"
