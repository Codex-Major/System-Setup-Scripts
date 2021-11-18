# Kalbuntu
Bash script to install all of my favorite tools on Ubuntu based distros, so I can get to red-teaming ASAP.

If you are using Linux Mint 20 to enable snapd you must:
  `sudo rm /etc/apt/preferences.d/nosnap.pref`

# Usage
  `git clone https://github.com/Codex-Major/System-Setup-Scripts`
  
  `cd System-Setup-Scripts/ubuntu;chmod +x kalbuntu.sh;./kalbuntu.sh`

  ! To use GUI apps, install vcxsrv on your host... https://sourceforge.net/projects/vcxsrv/
  
# Optional GUI apps/tools.
    code--------apt
    firefox-----apt
    krusader----apt
    nautilus----apt
    subl--------wget
    wireshark---apt
    
# Intalls these tools/packages... (and their dependencies.)
    aircrack-ng(suite)---apt
    binwalk--------------apt
    crackmapexec---------pipx
    curl-----------------apt
    dirb-----------------apt
    exiftool-------------apt
    Exploitdb------------https://github.com/offensive-security/exploitdb.git
    git------------------apt
    gobuster-------------apt
    hashcat--------------apt
    hydra----------------apt
    Impacket-------------https://github.com/SecureAuthCorp/impacket
    john-----------------apt
    masscan--------------apt
    neofetch-------------apt
    net-tools------------apt
    nikto----------------apt
    nmap-----------------apt
    pipx-----------------apt
    postgresql-----------apt
    proxychains4---------apt
    python3--------------apt
    python3-pip----------apt
    python3-venv---------apt
    recon-ng-------------apt
    Responder------------https://github.com/trustedsec/Responder
    ruby-----------------apt
    SEToolkit------------https://github.com/trustedsec/social-engineer-toolkit
    shodan---------------pip
    snapd----------------apt
    sqlite3--------------apt
    sqlmap---------------apt
    sslyze---------------pip
    steghide-------------apt
    subl-----------------apt (special)
    TheHarvester---------https://github.com/laramies/theHarvester
    vim------------------apt
    wfuzz----------------apt
    wpscan---------------gem

# `curl`s these repos...
    Metasploit-----------https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb

# `git clone`s these repos... (into /usr/share/wordlists)
    SeclLists------------https://github.com/danielmiessler/SecLists

# `wget`s this tool...
    wp6.sh---------------www.wifipineapple.com/wp6.sh
