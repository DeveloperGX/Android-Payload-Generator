#!/bin/bash
# This Tool All Files Programmed And Developed By Anonymous GX Team 
# colors
LRed='\033[1;31m'
LGreen='\033[1;32m'
# check for oprating system 
check_system() {
    if [[ -d "/data/data/com.termux" ]]; then
        echo -e "${GREEN}[+] You Are Using Termux.${NC}"
        SYSTEM="termux"
    elif [[ -f "/etc/debian_version" ]]; then
        echo -e "${GREEN}[+] You Are Using Linux System .${NC}"
        SYSTEM="kali"
    else
        echo -e "${LRed}[-] Sorry Your System Is Not Support Your System !${NC}"
        exit 1
    fi
}
# checking root on linux systems
check_root() {
    if [[ "$SYSTEM" != "termux" ]]; then
        if [[ "$EUID" -ne 0 ]]; then
            echo -e "${LRed}[-] Please Run This It As Root By sudo .${NC}"
            sleep 1s
            exit 1
        else
            echo -e "${GREEN}[+] Root Access Verified.${NC}"
        fi
    else
        echo -e "${YELLOW}[!] Skipping Root Check In Termux.${NC}"
    fi
}
#loading bar
loading_bar() {
    echo -e $LGreen ''
    figlet -c -f slant "Anonymous GX"
    sleep 2s
    echo ''
    echo -ne "$LGreen [+] Loading "
    for i in {1..40}; do
        echo -ne "▓"
        sleep 0.1
    done
    echo -e "${NC} Done!"
    sleep 1s
}

# removing Tool

removing_tool() {
    echo -e $LRed ""
    figlet -c -f slant "APG Uninstalling "
    sleep 1s 
    echo ''
    sleep 1s 
    if [[ "$SYSTEM" == "termux" ]]; then
    echo -e $LRed "Removing Tool Files "
    sleep 2s
    rm -rf $HOME/.GX-Tools/Android-Payload-Generator
    echo ''
    sleep 1s
    echo -e $LRed "Removing >> apg "
    echo ''
    rm -rf $PREFIX/bin/apg
    sleep 1s
    echo -e $LRed "Removing >> APG "
    echo ''
    rm -rf $PREFIX/bin/APG
    sleep 1s
    echo -e $LRed "Removing >> android-p-g "
    echo ''
    rm -rf $PREFIX/bin/android-p-g
    sleep 1s
    echo -e $LRed "Removing >> apg-uninstall "
    echo ''
    rm -rf $PREFIX/bin/apg-uninstall
    sleep 1s
    rm -rf $PREFIX/bin/APG
    sleep 1s
    rm -rf $PREFIX/bin/apg
    sleep 1s
    rm -rf $PREFIX/bin/android-p-g
    echo -e $LRed "Removing >> playit "
    echo ''
    sleep 1s
    rm -rf $PREFIX/bin/playit
    echo -e $LRed "Removing >> ngrok "
    echo ''
    sleep 1s
    rm -rf $PREFIX/bin/ngrok
    sleep 1s
    clear
    sleep 1s
    loading_bar
    sleep 1s
    elif [[ "$SYSTEM" == "kali" ]]; then
    echo -e $LRed "Removing Tool Files "
    sleep 2s
    rm -rf $HOME/.GX-Tools/Android-Payload-Generator
    echo ''
    sleep 1s
    rm -rf /usr/bin/apg
    echo -e $LRed "Removing >> apg "
    echo ''
    sleep 1s
    rm -rf /usr/bin/apg-uninstall
    echo -e $LRed "Removing >> apg-uninstall "
    echo ''
    sleep 1s
    rm -rf /usr/bin/APG
    echo -e $LRed "Removing >> APG "
    echo ''
    sleep 1s
    rm -rf /usr/bin/android-p-g
    echo -e $LRed "Removing >> android-p-g "
    echo ''
    echo -e $LRed "Removing >> playit "
    echo ''
    sleep 1s
    sudo apt autoremove playit
    echo -e $LRed "Removing >> ngrok "
    echo ''
    sleep 1s
    sudo apt autoremove ngrok
    sleep 1s
    clear
    sleep 1s
    loading_bar
    sleep 1s
    fi
    sleep 1s
    echo ''
    sleep 1s
    echo -e $LGreen "Success Removing (^_^) ."
    sleep 1s
    clear
    sleep 1s
    figlet -c -f slant "Succes Unnstalling"
    sleep 1s
    echo -e $LGreen "The Tool Was Uninstalling Successfully (^_^) ."
}
# Main
main() {
    sleep 1s 
    clear 
    sleep 1s
    loading_bar
    sleep 1s
    echo ""
    sleep 1s
    check_system
    sleep 1s
    echo ''
    check_root
    sleep 1s
    echo ''
    clear
    echo ""
    removing_tool
    sleep 1s
}
main
