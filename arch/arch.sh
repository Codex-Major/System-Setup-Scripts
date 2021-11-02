#!/bin/bash
echo "[*] Ensuring your distro is up to date..."
pacman -Syu
read -r -p "[->] Add a new user? (y/N): " ans1
if [ "$ans1" == "y" ] || [ "$ans1" == "Y" ]; then
    echo "[+] Installing sudo..."
    pacman -S sudo --noconfirm
    echo "[->] New user to add:"
    read newUser
    useradd --create-home $newUser
    echo "[->] Set user password..."
    passwd $newUser
    echo "[*] Added $newUser to wheel group."
    usermod -aG wheel $newUser
    echo "[*] Replacing /etc/sudoers file to add wheel..."
    cp newSudoersFile.txt /etc/sudoers
    su $newUser
    $currUser=$newUser
else
    echo "[-] No new user added."
    read -r -p "[->] What user is permmitted to install packages?(NOT root): " currUser
fi
read -r -p "[->] Would you like to install GUI apps as well? (y/N): " guiInst
if [ "$guiInst" == "y" ] || [ "$guiInst" == "yes"]; then
    read -r -p "[->] IP of Vcxsrv server? (ex. 192.168.1.123:0.0 ): " guisrv
    sudo -H -u $currUser bash -c "echo 'export DISPLAY="$guisrv"'>>~/.bashrc;source ~/.bashrc"
    echo "[+] Installing GUI apps through pacman..."
    sudo -H -u $currUser bash -c 'sudo pacman -S firefox firefox-dark-reader firefox-ublock-origin krusader kate nautilus --noconfirm'
else
    echo "[-] Not installing GUI apps!"
fi
echo "[+] Installing pacman packages..."
sudo -H -u $currUser bash -c 'sudo pacman -S sudo perl git python3 aircrack-ng android-tools binwalk code ettercap exploitdb hashcat hashcat-utils hexdump hydra hwinfo nikto net-tools neofetch nmap postgresql proxychains-ng routersploit tcpdump tor traceroute ufw vulscan wget whois wpscan --noconfirm'
echo "[*] Making new dir /home/$currUser/Apps"
sudo -H -u $currUser bash -c 'mkdir /home/$USER/Apps'
sudo -H -u $currUser bash -c 'cd /home/$USER/Apps'
echo "[+] Installing dirsearch..."
sudo -H -u $currUser bash -c 'sudo pacman -S python-certifi python-cffi python-chardet python-cryptography python-pysocks python-urllib3 --noconfirm'
sudo -H -u $currUser bash -c '/home/$USER/Apps;git clone https://aur.archlinux.org/dirsearch.git'
sudo -H -u $currUser bash -c 'cd /home/$USER/Apps/dirsearch;makepkg;cd src/dirsearch-0.4.2;sudo python3 setup.py install'
echo "[!] All done!"