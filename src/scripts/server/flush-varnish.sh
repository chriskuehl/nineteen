#!/bin/bash
varnishadm -S /etc/varnish/secret -T :6082 "ban.url /"

echo "OK"
