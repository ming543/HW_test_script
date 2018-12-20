#!/bin/bash
USB_RUN=/run/initramfs/memory/data/script

show_menu(){
    clear	
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}******EFCO Production Test*******************${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} 5025 test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5)${MENU} ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "Option 1 Picked";
        sh $USB_RUN/5025.sh; #The 3 terabyte
        show_menu;
        ;;

        2) clear;
        option_picked "Option 2 Picked";
        show_menu;
        ;;

        3) clear;
        option_picked "Option 3 Picked";
        show_menu;
        ;;

        4) clear;
        option_picked "Option 4 Picked";
        show_menu;
        ;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done

