#!/usr/bin/bash
# colors
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' 
Purple='\033[0;35m'
LPurple='\033[1;35m'
Blue='\033[0;34m'
LBlue='\033[1;34m'
LGreen='\033[1;32m'
LRed='\033[1;31m'
#Banner Colors 
colors=("$LRed" "$LBlue" "$LGreen" "$LPurple" "$Red")
color=${colors[$RANDOM % ${#colors[@]}]}
# check for oprating system
check_system() {
    if [[ -d "/data/data/com.termux" ]]; then
        echo -e "${GREEN}[+] You Are Using Termux.${NC}"
        SYSTEM="termux"
    elif [[ -f "/etc/debian_version" ]]; then
        echo -e "${GREEN}[+] You Are Using Linux System .${NC}"
        SYSTEM="kali"
    else
        echo -e "${RED}[-] Sorry Your System Is Not Support Your System !${NC}"
        exit 1
    fi
}
#checking root for linux systems
check_root() {
    if [[ "$SYSTEM" != "termux" ]]; then
        if [[ "$EUID" -ne 0 ]]; then
            echo -e "${RED}[-] Please Run This It As Root By sudo .${NC}"
            sleep 1s
            exit 1
        else
            echo -e "${GREEN}[+] Root Access Verified.${NC}"
            sleep 1s
        fi
    else
        echo -e "${YELLOW}[!] Skipping Root Check In Termux.${NC}"
    fi
}
# loading bar
loading_bar() {
    echo -e $LGreen ''
    figlet -c -f slant "Anonymous GX"
    sleep 2s
    echo ''
    echo -ne "$LGreen [+] Loading "
    for i in {1..30}; do
        echo -ne "▓"
        sleep 0.05
    done
    echo -e "${NC} Done!"
    sleep 1
}

# installation functions 

install_figlet() {
    sleep 2s
    clear
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        apt update; apt upgrade -y;
        pkg update -y && pkg upgrade -y;
        pkg install figlet git wget tar -y;
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update;
        sudo apt install figlet;
    fi
    echo -e "${GREEN}[+] Figlet Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_java() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing Java"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        apt update ; apt upgrade -y
        pkg update && pkg upgrade -y
        pkg install openjdk-17 -y
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update && sudo apt install openjdk-17-jdk unzip wget -y
    fi
    echo -e "${GREEN}[+] Java Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_xterm() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing XTerm"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        sleep 2s
        echo -e $LRed "Sorry XTerm Un Support Termux ! "
        sleep 1s
        echo -e $YELLOW "Skipping !"
        sleep 3s 
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update && sudo apt install xterm wget -y
    fi
    echo -e "${GREEN}[+] Java Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_apktool() {
    clear
    echo -e $LRed '';figlet -c -f slant "Installing APKTool"
    sleep 1s
    if [[ "$SYSTEM" == "termux" ]]; then
        echo -e $RED "Unsupported Sysyem : Skipping : "
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo wget -O /usr/local/bin/apktool https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool
        sleep 1s
        sudo wget -O /usr/local/bin/apktool.jar https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.11.1.jar
        sleep 1s 
        sudo chmod +x /usr/local/bin/apktool
        sleep 1s
        sudo chmod +x /usr/local/bin/apktool.jar
    fi
    echo -e "${GREEN}[+] APKTool Is Installed On Your Device Successfully (^_^). ${NC}"
}

install_zipalign() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing Zipalingn"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        echo -e $RED "Unsupported Sysyem : Skipping : "
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update -y; sudo apt install zipalign -y
    fi
    echo -e "${GREEN}[+] Zipalign Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_apksigner() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing APKSigner"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        echo -e $RED "Unsupported Sysyem : Skipping : "
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update; sudo apt install apksigner -y
    fi
    echo -e "${GREEN}[+] APKSigner Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_zip() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing Zip "
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        pkg update -y && pkg upgrade -y;
        pkg install unstable-repo -y;
        pkg install zip unzip -y ;
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update -y;
        sudo apt install zip unzip -y;
    fi
    echo -e "${GREEN}[+] Metasploit Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_keytool() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing KeyTool"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        echo -e $RED "Unsupported Sysyem : Skipping : "
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update -y;
        sudo apt install keytool -y
    fi
    echo -e "${GREEN}[+] KeyTool Is Installed On Your Device Successfully (^_^). ${NC}"
}
install_aapt() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing AAPT"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        echo -e $RED "Unsupported Sysyem : Skipping : "
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update -y;
        sudo apt install aapt -y
    fi
    echo -e "${GREEN}[+] AAPT Is Installed On Your Device Successfully (^_^). ${NC}"
}
# Official Social Links
YT=https://youtube.com/@linux_whith_mohamed
FB=https://www.facebook.com/61566203695703
WA=https://wa.me/+994402309201
TE=https://t.me/Dev_GX
GITHUB=https://github.com/DeveloperGX

show_contacts() {
    sleep 1s
    echo -e "${LBlue}╔══════════════════════════════════════════════════════════╗"
    sleep 0.08
    echo -e "${LGreen}║                 Created By Anonymous GX                  ${LGreen}║"
    sleep 0.08
    echo -e "${LBlue}╠══════════════════════════════════════════════════════════╣"
    sleep 0.08
    echo -e "${YELLOW}║ 🔗 YouTube : ${NC}${YT}    $YELLOW║"
    sleep 0.08
    echo -e "${YELLOW}║ 🔗 FaceBook : ${NC}${FB}    $YELLOW║"
    sleep 0.08
    echo -e "${YELLOW}║ 💬 Telegram: ${NC}${TE}                         $YELLOW║"
    sleep 0.08
    echo -e "${YELLOW}║ 📞 WhatsApp: ${NC}${WA}                 $YELLOW║"
    sleep 0.08
    echo -e "${YELLOW}║ 💻 GitHub  : ${NC}${GITHUB}              $YELLOW║"
    sleep 0.08
    echo -e "${LBlue}╚══════════════════════════════════════════════════════════╝${NC}"
    sleep 0.08
    echo ''
    
    sleep 1s
}
install_msf() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing Metasploit"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        pkg update -y && pkg upgrade -y;
        pkg install unstable-repo -y;
        pkg install git wget tar zip unzip curl ;
        source <(curl -fsSL https://kutt.it/msf)
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo rm msfinstall
        sudo apt update -y;
        sudo apt install git wget tar zip unzip curl -y;
        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
        sudo rm msfinstall
    fi
    echo -e "${GREEN}[+] Metasploit Is Installed On Your Device Successfully (^_^). ${NC}"
}
# binary variables
installer='#!/usr/bin/bash
LRed="\033[1;31m"
NC="\033[0m" 
LGR="\033[0;32m"
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
check_system() {
    if [[ -d "/data/data/com.termux" ]]; then
        echo -e "${GREEN}[+] You Are Using Termux.${NC}"
        SYSTEM="termux"
    elif [[ -f "/etc/debian_version" ]]; then
        echo -e "${GREEN}[+] You Are Using Linux System .${NC}"
        SYSTEM="kali"
    else
        echo -e "${RED}[-] Sorry Your System Is Not Support Your System !${NC}"
        exit 1
    fi
}
check_root() {
    if [[ "$SYSTEM" != "termux" ]]; then
        if [[ "$EUID" -ne 0 ]]; then
            echo -e "${RED}[-] Please Run This It As Root By sudo .${NC}"
            sleep 1s
            exit 1
        else
            echo -e "${GREEN}[+] Root Access Verified.${NC}"
            sleep 1s
        fi
    else
        echo -e "${YELLOW}[!] Skipping Root Check In Termux.${NC}"
    fi
}
sleep 1s
echo ""
sleep 1s
check_system
sleep 1s
echo ""
sleep 1s
check_root
echo ""
sleep 1s;
cd $HOME/.GX-Tools/Android-Payload-Generator ; sudo bash android-p-g.sh
'
uninstaller='#!/usr/bin/bash
LRed="\033[1;31m"
NC="\033[0m" 
LGR="\033[0;32m"
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
check_system() {
    if [[ -d "/data/data/com.termux" ]]; then
        echo -e "${GREEN}[+] You Are Using Termux.${NC}"
        SYSTEM="termux"
    elif [[ -f "/etc/debian_version" ]]; then
        echo -e "${GREEN}[+] You Are Using Linux System .${NC}"
        SYSTEM="kali"
    else
        echo -e "${RED}[-] Sorry Your System Is Not Support Your System !${NC}"
        exit 1
    fi
}
check_root() {
    if [[ "$SYSTEM" != "termux" ]]; then
        if [[ "$EUID" -ne 0 ]]; then
            echo -e "${RED}[-] Please Run This It As Root By sudo .${NC}"
            sleep 1s
            exit 1
        else
            echo -e "${GREEN}[+] Root Access Verified.${NC}"
            sleep 1s
        fi
    else
        echo -e "${YELLOW}[!] Skipping Root Check In Termux.${NC}"
    fi
}
sleep 1s
echo ""
sleep 1s
check_system
sleep 1s
echo ""
sleep 1s
check_root
echo ""
sleep 1s;
cd $HOME/.GX-Tools/Android-Payload-Generator ; sudo bash uninstaller.sh
'
# tool installation Funcktion 
install_tool() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing Tool"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        cd ~/.GX-Tools/
        git clone https://github.com/DeveloperGX/Android-Payload-Generator
        cd Android-Payload-Generator
        chmod +x android-p-g.sh
        sleep 0.5s
        echo "cd ~/.GX-Tools/Android-Payload-Generator ; bash android-p-g.sh " > $PREFIX/bin/apg
        sleep 0.5s
        chmod +x $PREFIX/bin/apg
        sleep 0.5s
        echo "cd ~/.GX-Tools/Android-Payload-Generator ; bash android-p-g.sh " > $PREFIX/bin/APG
        sleep 0.5s
        chmod +x $PREFIX/bin/APG
        sleep 0.5s
        echo "cd ~/.GX-Tools/Android-Payload-Generator ; bash android-p-g.sh " > $PREFIX/bin/android-p-g
        sleep 0.5s
        chmod +x $PREFIX/bin/android-p-g
        echo "cd ~/.GX-Tools/Android-Payload-Generator ; bash uninstaller.sh " > $PREFIX/bin/apg-uninstall
        sleep 0.5s
        chmod +x $PREFIX/bin/apg-uninstall
    elif [[ "$SYSTEM" == "kali" ]]; then
        cd ~/.GX-Tools/
        git clone https://github.com/DeveloperGX/Android-Payload-Generator
        cd Android-Payload-Generator
        sleep 1s
        sudo chmod +x android-p-g.sh
        sleep 1s
        sudo chmod +x uninstaller.sh
        sudo echo "$installer" > /usr/bin/apg
        sleep 0.5s
        sudo chmod +x /usr/bin/apg
        sleep 0.5s
        sudo echo "$installer" > /usr/bin/APG
        sleep 0.5s
        sudo chmod +x /usr/bin/APG
        sleep 0.5s
        sudo echo "$installer" > /usr/bin/android-p-g
        sleep 0.5s
        sudo chmod +x /usr/bin/android-p-g
        sleep 0.5s
        sudo echo "$uninstaller" > /usr/bin/apg-uninstall
        sleep 0.5s
        sudo chmod +x /usr/bin/apg-uninstall
    fi
    echo -e "${GREEN}[+] The Tool Is Installed On Your Device Successfully (^_^). ${NC}"
    sleep 1s
}
# Check if requirments is exist
check_zipalign() {
    if command -v zipalign &> /dev/null; then
        echo -e "${GREEN}[+] Zipalign Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Zipalign Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_zipalign
    fi
}
check_xterm() {
    if command -v xterm &> /dev/null; then
        echo -e "${GREEN}[+] XTerm Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] XTerm Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_xterm
    fi
}
check_tool() {
    if command -v apg &> /dev/null; then
        echo -e "${GREEN}[+] Anonymous GX Tool Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Anonymous GX Tool Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_tool
    fi
    sleep 1s
}
check_java() {
    if command -v java &> /dev/null; then
        echo -e "${GREEN}[+] Java Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Java Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_java
    fi
}
check_figlet() {
    if command -v figlet &> /dev/null; then
        echo -e "${GREEN}[+] Figlet Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Figlet Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_figlet
    fi
}
check_apktool() {
    if command -v apktool &> /dev/null; then
        echo -e "${GREEN}[+] APKTool Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] APKTool Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_apktool
    fi
}
check_apksigner() {
    if command -v apksigner &> /dev/null; then
        echo -e "${GREEN}[+] APKSigner Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] APKSigner Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_apksigner
    fi
}
check_zip() {
    if command -v zip &> /dev/null; then
        echo -e "${GREEN}[+] Zip Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Zip Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_figlet
    fi
}
check_msf() {
    if command -v msfconsole &> /dev/null; then
        echo -e "${GREEN}[+] Metasploit FrameWork Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Metasploit FrameWork Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_msf
    fi
}
check_keytool() {
    if command -v keytool &> /dev/null; then
        echo -e "${GREEN}[+] KeyTool Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] KeyTool Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_keytool
    fi
}
check_aapt() {
    if command -v aapt &> /dev/null; then
        echo -e "${GREEN}[+] AAPT Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] AAPT Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_aapt
    fi
}
#Check If Payloads directory is Exists
check_dirs() {
    if [ -d "$HOME/.GX-Tools/" ]; then 
        echo ''
    else 
        mkdir $HOME/.GX-Tools    
    fi
    sleep 1s
}
# Main Menu 
main_menu() {
    check_dirs
    sleep 1s
    clear
    sleep 0.5s
    echo -e $LGreen '';figlet -c -f slant "Starting Tool"
    sleep 2s
    clear
    sleep 1s
    loading_bar
    echo ''
    check_system
    sleep 1s
    echo ''
    sleep 1s 
    check_root
    sleep 1s
    echo ''
    sleep 1s
    clear
    sleep 1s
    loading_bar
    echo ''
    check_msf
    sleep 1s
    clear
    sleep 0.8s
    echo -e ${color} "'####:'##::: ##::'######::'########::::'###::::'##:::::::'##:::::::'########:'########::"
    sleep 0.08
    echo -e ${color} ". ##:: ###:: ##:'##... ##:... ##..::::'## ##::: ##::::::: ##::::::: ##.....:: ##.... ##:"
    sleep 0.08
    echo -e ${color} ": ##:: ####: ##: ##:::..::::: ##:::::'##:. ##:: ##::::::: ##::::::: ##::::::: ##:::: ##:"
    sleep 0.08
    echo -e ${color} ": ##:: ## ## ##:. ######::::: ##::::'##:::. ##: ##::::::: ##::::::: ######::: ########::"
    sleep 0.08
    echo -e ${color} ": ##:: ##. ####::..... ##:::: ##:::: #########: ##::::::: ##::::::: ##...:::: ##.. ##:::"
    sleep 0.08
    echo -e ${color} ": ##:: ##:. ###:'##::: ##:::: ##:::: ##.... ##: ##::::::: ##::::::: ##::::::: ##::. ##::"
    sleep 0.08
    echo -e ${color} "'####: ##::. ##:. ######::::: ##:::: ##:::: ##: ########: ########: ########: ##:::. ##:"
    sleep 0.08
    echo -e ${color} "....::..::::..:::......::::::..:::::..:::::..::........::........::........::..:::::..::"
    sleep 1s
    echo ''
    echo -e "${LGreen}                            Script Version => 1"
    sleep 0.08
    echo ''
    show_contacts
    check_dirs
    check_aapt
    check_apksigner
    check_apktool
    check_figlet
    check_java
    check_keytool
    check_msf
    check_xterm
    check_zip
    sleep 1s 
    check_tool
    clear 
    echo -e $LGreen ''; figlet -c -f slant "Success Installation "
    sleep 1s 
    echo ''
    sleep 1s
    echo -e $LGreen "The Tool Was Installation Successfull You Can Start It By "APG" or "apg" or "android-p-g" Commands Or Uninstall By "apg-uninstall" commaned (^_^) " 
    exit
}
main_menu
