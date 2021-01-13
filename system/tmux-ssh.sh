#!/bin/bash
# A shell script to display menus on tmux
# Store menu options selected by the user
INPUT=/tmp/screening_main
REV=$(cat /home/production/hw_test/revision | head -1 | awk '{print $1}')
TMUX_LOC="/home/production/hw_test/system"

session_check(){
	tmux has-session -t DRBL 2>/dev/null
}



if session_check ; then
	echo "Session already exists, Re-run after 2 Secs!"
	sleep 2
	tmux kill-session -t DRBL
#	tmux kill-session -a
	sh $0
else

	tmux new-session -d -s DRBL 
	tmux send-key -t DRBL '' C-c
	tmux send-key -t DRBL '' Enter
	tmux send-key -t DRBL 'sudo netstat -atnp | grep ESTA | grep 192.168' Enter

	tmux split-window -h -p 15 
	tmux send-key -t DRBL '' C-c
	tmux send-key -t DRBL '' Enter
	sleep 2
	tmux send-key -t DRBL "$TMUX_LOC/client_select.sh" Enter
	tmux attach-session -d -t DRBL 
fi

#tmux new-window -t DEBL:1 -n 'main' '/usr/bin/irssi'
#tmux new-window -t DRBL:2 -n 'client' 'ssh 192.168.104.101'

#tmux select-window -t DRBL:0
#tmux -2 attach-session -t DRBL
