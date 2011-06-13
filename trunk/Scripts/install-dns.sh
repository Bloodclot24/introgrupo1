#!/bin/bash

args=("$@")

case ${args[0]} in
	"root-dns") ./install-root-dns.sh;;
	"tilcara-dns") ./install-tilcara-dns.sh;;
	"resto-dns") ./install-resto-dns.sh;;
esac
