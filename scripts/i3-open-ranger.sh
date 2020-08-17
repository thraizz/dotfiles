#!/bin/bash
i3-msg -t get_tree | jq --raw-output | grep ranger-floating
if [ $? -ne 0 ]; then
    xfce4-terminal -T ranger-floating -x /home/arons/scripts/start_ranger.sh
else
    i3-msg [title="ranger-floating"] focus
fi
