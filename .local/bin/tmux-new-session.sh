#!/bin/sh
tmux new-session -s $(date +%s)
exit $?
