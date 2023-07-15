#!/bin/bash

set -eu -o pipefail
test $? -eq 0 || exit 1 "You need sudo privilege to run this script"

echo Uninstalling 1337 H4X0R 700L$. . .
sleep 4

# install wireshark
apt-get purge -y wireshark-qt

# loop to install "ez" packages
while read -r p ; do apt-get purge -y $p ; done < <(cat << "EOF"
	dirb
	dnsrecon
	gobuster
	hashcat
	iputils-arping
	medusa
	ncat
	ncrack
	nikto
	nmap
	npm
	openvas-scanner
	plocate
	python3-pip
	sqlmap
	tcpdump
	wfuzz
	whois
EOF
)

echo Removing PenTools directory. . .
sleep 6

rm -r PenTools/
apt-get clean
