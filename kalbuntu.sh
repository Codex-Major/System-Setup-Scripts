#!/bin/bash
echo -e "\033[1;32mInstalling apt packages..."
sudo apt install python3-pip build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr neofetch gobuster wfuzz nmap john aircrack-ng dirb sqlmap hydra proxychains4 nikto masscan recon-ng -y
mkdir ~/Apps
cd ~/Apps
echo -e "\033[1;32mInstalling Metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
rm msfinstall
echo -e "\033[1;32mCloning Wordlist-Generator..."
git clone https://github.com/Codex-Major/Wordlist-Generator
echo -e "\033[1;32mCloning exploit-database..."
sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database
echo -e "\033[1;32mCreating symlink for searchsploit..."
sudo ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
sudo cp -n /opt/exploit-database/.searchsploit_rc ~/
echo -e "\033[1;32mCloning impacket..."
git clone https://github.com/SecureAuthCorp/impacket
cd ~/Apps/impacket
echo -e "\033[1;32mInstalling impacket..."
python3 -m pip install .
sudo mkdir /usr/share/wordlists
cd /usr/share/wordlists
echo -e "\033[1;32mCloning SecLists..."
sudo git clone https://github.com/danielmiessler/SecLists
cd ~
echo -e "\033[1;32mDone!"
