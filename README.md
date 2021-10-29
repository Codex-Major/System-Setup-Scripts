# Kalbuntu
Bash script to install all of my favorite tools from Kali on Ubuntu-20.04, so's I can get to red-teaming ASAP. 

# Usage
  `git clone https://github.com/Codex-Major/kalbuntu;cd kalbuntu;chmod +x kalbuntu.sh;./kalbuntu.sh`

  ! To use GUI apps, install vcxsrv on your host... https://sourceforge.net/projects/vcxsrv/
  
   on the server `export DISPLAY="<host ip>:<display #>"`
   
   for persistence add the export statement to your `~/.bashrc` file 
  

# `apt install`s these packages... (and their dependencies.)
    aircrack-ng(suite)
    crackmapexec
    curl
    dirb
    exiftool
    firefox
    gobuster
    hashcat
    hydra
    john
    masscan
    neofetch
    net-tools
    nikto
    nmap
    pipx
    postgresql
    proxychains4
    python3
    python3-pip
    recon-ng
    ruby
    snapd
    sqlite3
    sqlmap
    steghide
    subl
    vim
    wfuzz
    wpscan
    
# `git clone`s these repos... (and installs them accordingly.)
    Exploitdb------------https://github.com/offensive-security/exploitdb.git
    Impacket-------------https://github.com/SecureAuthCorp/impacket
    Metasploit-----------https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb
    Responder------------https://github.com/trustedsec/Responder
    SEToolkit------------https://github.com/trustedsec/social-engineer-toolkit
    SeclLists------------https://github.com/danielmiessler/SecLists
    Wordlist-Generator---https://github.com/Codex-Major/Wordlist-Generator
