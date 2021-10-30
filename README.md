# Kalbuntu
Bash script to install all of my favorite tools from Kali on Ubuntu-20.04, so I can get to red-teaming ASAP. 

# Usage
  `git clone https://github.com/Codex-Major/Ubuntu20.04-Setup-Scripts`
  
  `cd Ubuntu20.04-Setup-Scripts;chmod +x kalbuntu.sh;./kalbuntu.sh`

  ! To use GUI apps, install vcxsrv on your host... https://sourceforge.net/projects/vcxsrv/
  
   on the server `export DISPLAY="<host ip>:<display #>"`
   
   for persistence concatenate the export statement to your `~/.bashrc` file.
  

# `apt install`s these packages... (and their dependencies.)
    aircrack-ng(suite)
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
    postgresql
    proxychains4
    python3
    python3-pip
    python3-venv
    recon-ng
    ruby
    snapd
    sqlite3
    sqlmap
    steghide
    subl
    vim
    wfuzz
    wireshark
    wpscan
    
# `pip install`s these packages...(or pipx)
    crackmapexec
    sslyze
    shodan
    pipx

# `git clone`s these repos... (and installs them accordingly.)
    Exploitdb------------https://github.com/offensive-security/exploitdb.git
    Impacket-------------https://github.com/SecureAuthCorp/impacket
    Responder------------https://github.com/trustedsec/Responder
    SEToolkit------------https://github.com/trustedsec/social-engineer-toolkit
    SeclLists------------https://github.com/danielmiessler/SecLists
    TheHarvester---------https://github.com/laramies/theHarvester
    Wordlist-Generator---https://github.com/Codex-Major/Wordlist-Generator

# `curl`s these repos...
    Metasploit-----------https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb

# `wget`s this tool...
    wp6.sh---------------www.wifipineapple.com/wp6.sh
