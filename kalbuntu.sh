#!/bin/bash
echo -e "\033[1;32m\n[*] Ensuring that you distro is up to date..."
sudo apt update && sudo apt upgrade -y
echo -e "\033[1;32m\n[+] Installing apt packages..."
sudo apt install -y build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr ruby python3 python3-pip net-tools neofetch gobuster wfuzz nmap john aircrack-ng dirb sqlmap hydra proxychains4 nikto masscan recon-ng steghide exiftool vim hashcat firefox 
echo -e "\033[1;32m[+] Installing WPScan..."
gem install wpscan
echo -e "\033[1;32m[+] Installing pipx..."
python3 -m pip install pipx
pipx ensurepath
echo -e "\033[1;32m[+] Installing CrackMapExec..."
pipx install crackmapexec
echo -e "\033[1;32m\n[!] Attempting to mkdir ~/Apps"
mkdir ~/Apps
cd ~/Apps
echo -e "\033[1;32m\n[+] Installing Metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
rm msfinstall
echo -e "\033[1;32m\n[+] Cloning social-engineer-toolkit..."
git clone https://github.com/trustedsec/social-engineer-toolkit/ set/
cd set
echo -e "\033[1;32m\n[*] Installing SET..."
pip install -r requirements.txt
sudo python3 setup.py
cd ..
echo -e "\033[1;32m\n[+] Cloning Responder..."
git clone https://github.com/trustedsec/Responder
echo -e "\033[1;32m\n[*] Creating alias for Responder.py ..."
sudo echo "alias responder='python3 ~/Apps/Responder/Responder.py'" >> ~/.bash_aliases
echo "alias responder='python3 ~/Apps/Responder/Responder.py'" >> ~/.bash_aliases
source ~/.bash_aliases
echo -e "\033[1;32m\n[+] Cloning Wordlist-Generator..."
git clone https://github.com/Codex-Major/Wordlist-Generator
echo -e "\033[1;32m\n[+] Cloning exploit-database..."
sudo git clone https://github.com/offensive-security/exploitdb.git /opt/exploit-database
echo -e "\033[1;32m\n[*] Creating symlink for searchsploit..."
sudo ln -sf /opt/exploit-database/searchsploit /usr/local/bin/searchsploit
sudo cp -n /opt/exploit-database/.searchsploit_rc ~/
echo -e "\033[1;32m\n[+] Cloning impacket..."
git clone https://github.com/SecureAuthCorp/impacket
cd ~/Apps/impacket
echo -e "\033[1;32m\n[*] Installing impacket..."
python3 -m pip install .
echo -e "\033[1;32m\n[!] Attempting to mkdir /usr/share/wordlists..."
sudo mkdir /usr/share/wordlists
cd /usr/share/wordlists
echo -e "\033[1;32m\n[+] Cloning SecLists..."
sudo git clone https://github.com/danielmiessler/SecLists
echo -e "\033[1;32m\n---------------------------------------------------------------------"
echo -e "\033[1;32m\n[!] All done!"
echo -e "\033[1;32m[*] To use gui apps on your Windows10 host, install vcxsrv from https://sourceforge.net/projects/vcxsrv/ "
echo -e "\033[1;32m     and use - echo 'export DISPLAY=\"<host ip>:0.0\"'>>~/.bashrc;source ~/.bashrc"
echo -e "\033[1;32m[*] Clean up with - cd ..;sudo rm -r kalbuntu"
