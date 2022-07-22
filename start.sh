#!/bin/bash
#   |                                      |
# --+--------------------------------------+--
#   |    Code by : yasserbdj96             |
#   |    Email : yasser.bdj96@gmail.com    |
# --+--------------------------------------+--
#   |                                      |

#START{
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue

echo -e "${Red}██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗${Color_Off}";
echo -e "${Red}██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║${Color_Off}";
echo -e "${Red}██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║${Color_Off}";
echo -e "${Red}██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║${Color_Off}";
echo -e "${Red}██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗${Color_Off}";
echo -e "${Red}╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝${Color_Off}";
echo -e "                                ${Yellow}Code by -> ${Green}yasserbdj96${Color_Off}";
echo "";

echo -e "${Green}1] ${Yellow}ngrok${Color_Off}";
echo -e "${Green}2] ${Yellow}Telegram${Color_Off}";
echo -e "${Green}3] ${Yellow}Coinomi Wallet${Color_Off}";
echo -e "${Red}0] Exit${Color_Off}";
echo "";



function jumpto {
    read -p 'Choose a number [1-3]: ' input;

    if [ "$input" == "1" ] ; then
        app="ngrok";
    elif [ "$input" == "2" ] ; then
        app="telegram";
    elif [ "$input" == "3" ] ; then
        app="coinomi";
    elif [ "$input" == "0" ] ; then
        exit;
    else
        echo -e "${Red}The option you entered is not available${Color_Off}";
    fi

    read -p 'Will you install OR uninstall [i/u]: ' iu;
    cd apps/$app
    bash install.sh -$iu
    cd ..
    cd ..
    jumpto;
}
jumpto;
#}END.