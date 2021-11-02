#!/bin/bash
echo "[*] Ensuring your distro is up to date..."
pacman-key --init
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
sudo -H -u $currUser bash -c 'sudo pacman -S aircrack-ng binwalk curl git hashcat hydra impacket john net-tools nikto nmap masscan python3 python3-pip ruby sqlmap vim wget wpscan --noconfirm'
echo "[+] Installing yay cli packages..."
sudo -H -u $currUser bash -c 'yay -S lsd dirb gobuster dirsearch recon-ng proxychains python-pip responder steghide sslyze wfuzz wordlists --noconfirm'
echo "[+] Installing pip packages..."
sudo -H -u $currUser bash -c 'pip install crackmapexec shodan'
echo "[!] All done!"
