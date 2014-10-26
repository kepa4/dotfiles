#! /bin/sh
tmux -2 new-session -d -s otorder

### localhost window
# server pane
tmux rename-window -t otorder:1 'localhost'
tmux send-keys "cd ~/Documents/dev/rankomatic/ && bash bin/run_dev_server.sh" C-m

# rqworker panes
tmux split-window
tmux select-pane -t 1
tmux send-keys "cd ~/Documents/dev/rankomatic/ && workon ot_orders && rqworker" C-m

tmux split-window -h
tmux select-pane -t 2
tmux send-keys "workon ot_orders && rqinfo" C-m


### editing window
tmux new-window -t otorder:2 -n 'editing'
tmux send-keys "cd ~/Documents/dev/rankomatic/rankomatic" C-m
tmux split-window -h
tmux select-pane -t 0
tmux resize-pane -x 85
tmux select-pane -t 1
tmux split-window


### otorder.com window
tmux new-window -t otorder:3 -n 'otorder.com'
tmux send-keys "otorder-connect" C-m


### select default window and attach
tmux select-window -t otorder:2
tmux -2 attach-session -t otorder
