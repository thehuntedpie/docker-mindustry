#!/bin/bash
COMMAND=$1
TMUX_SESSION=Mindustry
MINDUSTRY_USER=mindustry

function console_run() {
    su ${MINDUSTRY_USER} bash -c "tmux send-keys -t ${TMUX_SESSION} -l ${COMMAND}"
    su ${MINDUSTRY_USER} bash -c "tmux send-keys -t ${TMUX_SESSION} Enter"
}

console_run $COMMAND
