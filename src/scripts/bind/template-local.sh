#!/bin/bash

echo "//"
echo "// Do any local configuration here"
echo "//"
echo ""
echo "// Consider adding the 1918 zones here, if they are not used in your"
echo "// organization"
echo "//include \"/etc/bind/zones.rfc1918\";"
echo ""

for i in /etc/bind/zones/*; do
	ZONE_FILE_LARGE=$i
	ZONE_FILE=${ZONE_FILE_LARGE:16}

	echo "zone \"$ZONE_FILE.\" {"
        echo "	type master;"
        echo "	file \"$ZONE_FILE_LARGE\";"
	echo "};"
done
