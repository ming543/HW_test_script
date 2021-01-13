#!/bin/bash
# A shell script to display menus on tmux
# Store menu options selected by the user
INPUT=/tmp/screening_main
REV=$(cat /home/production/hw_test/revision | head -1 | awk '{print $1}')
N1=$(sudo netstat -atnp | grep ESTA | grep 192.168 | awk NR==1 | awk '{print $5}' | cut -c 1-15)
sudo rm $INPUT

### display main menu ###<high><width><menu_hight>
dialog --clear --title "[ M A I N - M E N U ]" \
--menu "Use 1-9 choose test item \nBuild by EFCO SamLee REV:$REV" 30 50 15 \
1 "$N1" \
p "Power off Tester" \
e "Exit tmux Screen" \
2>$INPUT

case $(cat $INPUT) in
        1)
		echo ""
		#tmux select-pane -L
		tmux select-pane -L
		tmux send-keys "nohup sshpass -p efco1234 ssh -o StrictHostKeyChecking=no production@$N1" Enter
		#tmux send-keys "sshpass -p efco1234 mosh production@$N1" Enter
		sleep 2
		tmux select-pane -R
		sh $0
	;;

	p)
                echo "p"
                sudo poweroff
                exit 0
        ;;

	e)
		clear
		echo "Exit tumx after 2 Secs!" 
		sleep 2
		tmux kill-session -t DRBL
		exit 3
	;;
	*)
		clear
		sh $0
	;;
esac




