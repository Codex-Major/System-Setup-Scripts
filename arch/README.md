# arch.sh
Bash script to install my favorite tools on Arch linux.

# Usage
  After using MatMoul's archfi.sh script to part drives and install a few base things...https://sourceforge.net/projects/archfi/
  
  This script acts as a replacement for the archdi desktop installation script...https://github.com/MatMoul/archdi
  
  (As root)
  
  `git clone https://github.com/Codex-Major/System-Setup-Scripts`
   
  `cd System-Setup-Scripts/arch;chmod +x arch.sh;./arch.sh`
    
  ! To use GUI apps, install vcxsrv on your host... https://sourceforge.net/projects/vcxsrv/
  
  ? The sudoers-file.txt is a normal /etc/sudoers file with `%wheel ALL=(ALL) ALL` uncommented. Used when a new user is added.
  
  ? If bash is screaming about line endings... /bin/bash^M:
    use `dos2unix` to convert the script.
  
# Optional GUI apps/tools...
      code--------------------yay
      firefox-----------------pacman
      firefox-dark-reader-----pacman
      firefox-ublock-origin---pacman
      krusader----------------pacman
      kate--------------------pacman
      nautilus----------------pacman
      
# Installs these tools...
      aircrack-ng----pacman
      binwalk--------pacman
      crackmapexec---pip
      curl-----------pacman
      dirb-----------yay
      dirsearch------yay
      exploitdb------pacman
      git------------pacman
      gobuster-------yay
      hashcat--------pacman
      hydra----------pacman
      impacket-------pacman
      john-----------pacman
      lsd------------yay
      masscan--------pacman
      net-tools------pacman
      nikto----------pacman
      nmap-----------pacman
      proxychains-ng----yay
      python-pip-----yay
      python3--------pacman
      recon-ng-------yay
      responder------yay
      ruby-----------pacman
      shodan---------pip
      sqlmap---------pacman
      sslyze---------yay
      steghide-------yay
      vim------------pacman
      wfuzz----------yay
      wget-----------pacman
      wordlists------yay
      wpscan---------pacman
      yay------------pacman
