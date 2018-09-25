#!/bin/bash
COMMAND=$1
su mindustry bash -c "tmux send-keys -t Mindustry -l ${COMMAND}"
su mindustry bash -c "tmux send-keys -t Mindustry Enter"
