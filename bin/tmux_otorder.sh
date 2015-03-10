#! /bin/bash
NAME='otorder'
SUCCESS=0
WAIT_SECS=1

tmux attach -t $NAME
OUT=$?

if [ $OUT -eq $SUCCESS ]; then
    exit
else
    tmux -2 new-session -d -s $NAME

    ### localhost window
    tmux rename-window -t $NAME:1 'localhost'

    # rqworker panes
    tmux split-window
    tmux select-pane -t 1
    tmux send-keys "cd ~/Documents/dev/rankomatic/" C-m
    tmux send-keys "workon otorder" C-m
    tmux send-keys "./otorderd_logd.py start" C-m
    sleep $WAIT_SECS
    tmux send-keys "./otorderd start" C-m
    sleep $WAIT_SECS

    # terminal pane
    tmux split-window -h

    # server pane
    tmux select-pane -t 0
    tmux send-keys "cd ~/Documents/dev/rankomatic/" C-m
    tmux send-keys "bash rankomatic/bin/run_dev_server.sh" C-m


    ### editing window
    tmux new-window -t $NAME:2 -n 'editing'
    tmux send-keys "cd ~/Documents/dev/rankomatic/rankomatic" C-m
    tmux split-window -h
    tmux select-pane -t 0
    tmux resize-pane -x 85
    tmux select-pane -t 1
    tmux split-window


    ### otorder.com window
    tmux new-window -t $NAME:3 -n 'otorder.com'
    tmux send-keys "otorder-connect" C-m


    ### select default window and attach
    tmux select-window -t $NAME:2
    tmux -2 attach-session -t $NAME
fi
