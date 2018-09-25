#!/bin/bash -x

MINDUSTRY_USER=mindustry
MINDUSTRY_GROUP=$(su $MINDUSTRY_USER 'id -g')
MINDUSTRY_HOME=$(su $MINDUSTRY_USER 'echo $HOME')

# define server command
SERVER_CMD='java -jar /usr/local/share/mindustry/server.jar host'
TMUX_SESSION=Mindustry

# change ownership of home directory
chown ${MINDUSTRY_USER}:${MINDUSTRY_GROUP} -R ${MINDUSTRY_HOME}

# become non-elevated user and run host in tmux
su ${MINDUSTRY_USER} bash -c "tmux new-session -s ${TMUX_SESSION} '${SERVER_CMD}'"

# make pipe file for docker logs (may solve issues showing raw tmux output)
su ${MINDUSTRY_USER} bash -c "mkfifo /tmp/tmuxpipe"
su ${MINDUSTRY_USER} bash -c "tmux pipe-pane -o -t ${TMUX_SESSION} 'cat >> /tmp/tmuxpipe'"
cat /tmp/tmuxpipe
