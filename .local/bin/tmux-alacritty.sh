#!/bin/sh
cur_time=$(date +%s)
alacritty --command=tmux-new-session.sh && tmux kill-session -t $cur_time 
