#!/bin/bash
sudo apt install python3-pip build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr neofetch gobuster wfuzz nmap john aircrack-ng dirb sqlmap hydra proxychains4 nikto masscan -y
mkdir ~/Apps
cd ~/Apps
git clone https://github.com/Codex-Major/Wordlist-Generator
git clone https://github.com/SecureAuthCorp/impacket
cd ~/Apps/impacket
python3 -m pip install .
cd /usr/share/wordlists
git clone https://github.com/danielmiessler/SecLists
cd ~
