#!/bin/sh
tmux new-session -d -s TMUX_NAME

tmux new-window -t TMUX_NAME:0 -n 'SCREEN_NAME0' '/usr/bin/irssi'
tmux new-window -t TMUX_NAME:1 -n 'SCREEN_NAME1' 'ssh 192.168.100.101'
tmux new-window -t TMUX_NAME:2 -n 'SCREEN_NAME2' 'ssh 192.168.100.102'

tmux select-window -t TMUX_NAME:1
tmux -2 attach-session -t TMUX_NAME
