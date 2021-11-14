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
    read -r -p "[->] What user is permitted to install packages?(NOT root): " currUser
fi

read -r -p "[->] Would you like to install OpenSSH for remote access? (y/N): " sshInst
if [ "$sshInst" == "y" ] || [ "$sshInst" == "Y"]; then
    echo "[+] Installing and configuring OpenSSH to start on boot..."
    sudo -H -u $currUser bash -c "sudo pacman -S openssh --noconfirm;sudo sytemctl enable sshd;sudo systemctl start sshd"
else
    echo "[-] Not installing OpenSSH!"
fi

read -r -p "[->] Would you like to install UFW for a firewall? (y/N): " ufwInst
if [ "$ufwInst" == "y" ] || [ "$ufwInst" == "Y"]; then
    sudo -H -u $currUser bash -c "sudo pacman -S ufw --noconfirm"
    echo "[!]" 
    read -r -p "[->] Enable UFW on boot? (y/N): " ufwOnBoot
    if [ "$ufwOnBoot" == "y" ] || [ "$ufwOnBoot" == "Y"]; then
        sudo -H -u $currUser bash -c "sudo systemctl enable ufw"
    else
        echo "[-] Okay... Not enabling UFW on boot..."
    fi
else
    echo "[-] Okay... Not installing UFW..."
fi

read -r -p "[->] Would you like to install GUI apps as well? (y/N): " guiInst
if [ "$guiInst" == "y" ] || [ "$guiInst" == "Y"]; then
    read -r -p "[->] IP of Vcxsrv server? (ex. 192.168.1.123:0.0 ): " guisrv
    sudo -H -u $currUser bash -c "echo 'export DISPLAY="$guisrv"'>>~/.bashrc;source ~/.bashrc"
else
    echo "[-] Not installing GUI apps!"
fi

echo "[+] Installing yay..."
sudo -H -u $currUser bash -c 'sudo pacman -S git --noconfirm'
sudo -H -u $currUser bash -c 'cd /opt;sudo git clone https://aur.archlinux.org/yay-git.git;sudo chown -R $currUser:$currUser ./yay-git;cd yay-git;makepkg -si'
echo "[+] Running 'yay -Syu' as $currUser..."
sudo -H -u $currUser bash -c 'yay -Syu'

if [ "$guiInst" == "y" ] || [ "$guiInst" == "Y"]; then
    echo "[+] Installing GUI apps..."
    sudo -H -u $currUser bash -c 'sudo pacman -S firefox firefox-dark-reader firefox-ublock-origin krusader kate nautilus --noconfirm'
    sudo -H -u $currUser bash -c 'yay -S code --noconfirm'
fi

echo "[+] Installing pacman packages..."
sudo -H -u $currUser bash -c 'sudo pacman -S aircrack-ng binwalk curl git hashcat hydra impacket john net-tools nikto nmap masscan python3 ruby sqlmap vim wget exploitdb wpscan yay --noconfirm'
echo "[+] Installing yay packages..."
sudo -H -u $currUser bash -c 'yay -S lsd dirb gobuster dirsearch recon-ng proxychains-ng python-pip responder steghide sslyze wfuzz wordlists --noconfirm'
echo "[+] Installing pip packages..."
sudo -H -u $currUser bash -c 'pip install crackmapexec shodan'

echo "[*] Adding to ~/.bash_aliases..."
sudo -H -u $currUser bash -c "echo 'alias ls='lsd -lah''>>~/.bash_aliases"
sudo -H -u $currUser bash -c 'source ~/.bash_aliases'

echo "[*] Reverting to traditional interface names..."
sudo -H -u $currUser bash -c "sudo ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules"

echo "[!] All done!"
echo "------------------------------------------------------------"
echo "[!] Clean up (for safety) with: cd ../..;sudo rm -r System-Setup-Scripts"
