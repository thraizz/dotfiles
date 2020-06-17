#!/bin/bash

action="$1"
workspace="$2"

focused_workspace=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused).name')
echo $focused_workspace
active_postfix=${focused_workspace: -1}

target_workspace=${workspace}${active_postfix}
echo $target_workspace

if [[ "$focused_workspace" == "$target_workspace" ]]; then
	target_workspace=$(i3-msg -t get_workspaces | jq --raw-output '.[]|select(.focused == false and .visible).name')
fi

if [[ "$action" == "move" ]]; then
    i3-msg "move container to workspace $target_workspace"
else
    i3-msg "workspace $target_workspace"
fi
