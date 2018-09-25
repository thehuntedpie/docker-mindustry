#!/bin/bash -x
# change ownership of home directory
chown mindustry:mindustry -R ~mindustry

# become non-elevated user
#su mindustry

# define server command
SERVER_CMD='java -jar /usr/local/share/mindustry/server.jar host'

# run host in tmux
su mindustry bash -c "tmux new-session -s Mindustry '${SERVER_CMD}'"
#su mindustry bash -c "screen -m -S Mindustry '${SERVER_CMD}'"

mkfifo /tmp/tmuxpipe
tmux pipe-pane -o -t my_tmux_session 'cat >> /tmp/tmuxpipe'
cat /tmp/tmuxpipe
