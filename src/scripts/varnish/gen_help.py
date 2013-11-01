#!/usr/bin/env python3
import json, os

def get_backends():
	backends = json.load(open("data/backends"))
	
	for file in os.listdir("data/backends.d/"):
		backend = json.load(open("data/backends.d/" + file))
		backends.append(backend)
	
	return backends

def get_secret():
	with open("data/secret") as file:
		return file.readline().replace("\n", "")

def get_host_map(backends):
	host_map = {"http": {}, "https": {}}
	
	for backend in backends:
		if "handles" in backend:
			update_host_map(backend, host_map)
	
	return host_map

def update_host_map(backend, host_map):
	for proto in host_map:
		if proto in backend["handles"]:
			for host in backend["handles"][proto]:
				host_map[proto][host] = backend["name"]

