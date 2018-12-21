#!/bin/bash
USB_RUN=/run/initramfs/memory/data/HW_test_script
TEMP_LOG=/run/initramfs/memory/data/HW_test_script/tmp/model.tmp

ONE=5025
TWO=
THREE=
FOUR=
FIVE=

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
    echo -e "${MENU}**${NUMBER} Model: $ONE ${NORMAL}"
    echo -e "${MENU}**${NUMBER} Model: $TWO test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} Model: $THREE test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} Model: $FOUR test ${NORMAL}"
    echo -e "${MENU}**${NUMBER} Model: $FIVE test ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please input the model name to start test or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
    rm $TEMP_LOG
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
        $ONE) clear;
        echo "Test Model: $ONE" | tee -a $TEMP_LOG ;
        sh $USB_RUN/$ONE.sh; 
        show_menu;
        ;;

        $TWO) clear;
        echo "Test Model: $TWO" | tee -a $TEMP_LOG ;
        sh $USB_RUN/$TWO.sh; 
        show_menu;
        ;;

        $THREE) clear;
        echo "Test Model: $THREE" | tee -a $TEMP_LOG;
        sh $USB_RUN/$THREE.sh; 
        show_menu;
        ;;

        $FOUR) clear;
        echo "Test Model: $FOUR" | tee -a $TEMP_LOG;
        sh $USB_RUN/$FOUR.sh; 
        show_menu;
        ;;

        $FIVE) clear;
        echo "Test Model: $FIVE" | tee -a $TEMP_LOG;
        sh $USB_RUN/$FIVE.sh; 
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

