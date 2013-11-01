#!/usr/bin/env python3
from gen_help import get_backends, get_secret, get_host_map
import datetime

print("# Automatically generated VCL file -- do not edit!")
print("# Last updated: " + datetime.datetime.now().strftime("%Y-%m-%d at %H:%M"))
print("")

backends = get_backends()

for backend in backends:
	print("backend {} {{".format(backend["name"]))
	print("\t.host = \"{}\";".format(backend["host"]))
	print("\t.port = \"{}\";".format(backend["port"]))
	print("}")
	print("")

secret = get_secret()

print("sub vcl_recv {")
print("\tif (req.http.X-Pound == \"{}\" && req.http.X-Forwarded-Proto == \"https\") {{".format(secret))
print("\t\tset req.http.https = true;")
print("\t} else {")
print("\t\tunset req.http.https;")
print("\t}")

host_map = get_host_map(backends)

print("\tif (req.http.https) {")
print("\t\tif (false) {")
for host in host_map["https"]:
	print("\t\t}} else if (req.http.host == \"{}\") {{".format(host))
	print("\t\t\tset req.backend = {};".format(host_map["https"][host]))

print("\t\t} else {")
print("\t\t\tset req.backend = apache_secure;")
print("\t\t}")
print("\t} else {")
print("\t\tunset req.http.X-Forwarded-Proto;")
print("\t\tif (false) {")
# standard http hosts
for host in host_map["http"]:
	print("\t\t}} else if (req.http.host == \"{}\") {{".format(host))
	print("\t\t\tset req.backend = {};".format(host_map["http"][host]))

# redirect https-only hosts to https
for host in host_map["https"]:
	print("\t\t}} else if (req.http.host == \"{}\") {{".format(host))
	print("\t\t\terror 750 \"https://{}\" + req.url;".format(host))

print("\t\t} else {")
print("\t\t\tset req.backend = apache_secure;")
print("\t\t}")
print("\t}")

print("")
print("\tunset req.http.X-Pound;")
print("\tset req.hash_always_miss = true;")
print("}")

print("")
print("sub vcl_error {")
print("\tif (obj.status == 750) {")
print("\t\tset obj.http.Location = obj.response;")
print("\t\tset obj.status = 302;")
print("\t\treturn(deliver);")
print("\t}")
print("}")
