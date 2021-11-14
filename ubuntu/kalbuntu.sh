#!/bin/bash
read -rp "[?] Would you like to install GUI apps also? (y/N) > " askGui
if ["$askGui" == "y"] || ["$askGui" == "Y"]; then
    read -rp "[?] IP of vcxsrv server? (ex. 192.168.1.123:0.0) > " guiSrv
    echo 'export DISPLAY="$guiSrv"'>>~/.bashrc
    source ~/.bashrc
fi
echo -e "\033[1;32m\n[*] Ensuring that your distro is up to date..."
sudo apt update && sudo apt upgrade -y
echo -e "\033[1;32m\n[+] Installing apt packages..."
sudo apt install -y build-essential libreadline-dev libssl-dev libpq5 libpq-dev libreadline5 libsqlite3-dev libpcap-dev git-core autoconf postgresql pgadmin3 curl zlib1g-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev gawk bison libffi-dev libgdbm-dev libncurses5-dev libtool sqlite3 libgmp-dev gnupg2 dirmngr apt-transport-https ruby pastebinit python3 python3-pip python3-venv net-tools neofetch gobuster wfuzz nmap john aircrack-ng dirb sqlmap hydra proxychains4 nikto masscan recon-ng steghide libimage-exiftool-perl vim hashcat snapd
if ["$askGui" == "y"] || ["$askGui" == "Y"]; then
    echo -e "\033[1;32m\n[+] Installing gui apps"
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update && sudo apt-get install -y sublime-text firefox code nautilus krusader wireshark
fi
echo -e "\033[1;32m\n[+] Installing WPScan..."
sudo gem install wpscan
echo -e "\033[1;32m\n[+] Installing shodan..."
pip install shodan
echo -e "\033[1;32m\n[+] Installing SSLyze..."
pip install --upgrade setuptools
pip install sslyze
echo -e "\033[1;32m\n[+] Installing pipx..."
python3 -m pip install pipx
pipx ensurepath
echo -e "\033[1;32m\n[+] Installing CrackMapExec..."
pipx install crackmapexec
echo -e "\033[1;32m\n[!] Attempting to mkdir ~/Apps..."
mkdir ~/Apps
cd ~/Apps
echo -e "\033[1;32m\n[+] Installing Metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
rm msfinstall
echo -e "\033[1;32m\n[+] Cloning social-engineer-toolkit..."
git clone https://github.com/trustedsec/social-engineer-toolkit/ SET/
cd SET
echo -e "\033[1;32m\n[*] Installing SET..."
pip install -r requirements.txt
sudo python3 setup.py
cd ..
echo -e "\033[1;32m\n[!] Attempting to mkdir ~/Apps/wifi-pineapple..."
mkdir ~/Apps/wifi-pineapple
cd wifi-pineapple
echo -e "\033[1;32m\n[+] Installing Hak5's wp6.sh..."
wget www.wifipineapple.com/wp6.sh
chmod +x wp6.sh
cd ..
echo -e "\033[1;32m\n[*] Creating alias 'wp6' for wp6.sh..."
echo 'alias wp6="cd ~/Apps/wifi-pineapple;/.wp6.sh"' >> ~/.bash_aliases
source ~/.bash_aliases
echo -e "\033[1;32m\n[+] Cloning Responder..."
git clone https://github.com/trustedsec/Responder
echo -e "\033[1;32m\n[*] Creating alias 'responder' for Responder.py ..."
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
cd ..
echo -e "\033[1;32m\n[+] Cloning theHarvester..."
git clone https://github.com/laramies/theHarvester
echo -e "\033[1;32m\n[*] Installing theHarvester..."
pip install -r requirements.txt
cd theHarvester
sudo python3 setup.py install
cd /usr/share
echo -e "\033[1;32m\n[!] Attempting to mkdir /usr/share/wordlists..."
sudo mkdir /usr/share/wordlists
cd /usr/share/wordlists
echo -e "\033[1;32m\n[+] Cloning SecLists..."
sudo git clone https://github.com/danielmiessler/SecLists
echo -e "\033[1;32m\n---------------------------------------------------------------------"
echo -e "\033[1;32m\n[!] All done!"
if ["$askGui" == "y"] || ["$askGui" == "Y"]; then 
    echo -e "\033[1;32m\n[*] On your Win10 host, be sure to install vcxsrv from: https://sourceforge.net/projects/vcxsrv/ "
    echo -e " [*] Visit https://portswigger.net/burp/releases to install BurpSuite."
fi
echo -e "\033[1;32m\n[*] Clean up with: cd ../..;sudo rm -r System-Setup-Scripts"
echo -e "\033[1;32m\n[*] Please run 'shodan init <api key>' before using shodan."
echo -e "\033[1;32m\n---------------------------------------------------------------------"
