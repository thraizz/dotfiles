#!/bin/bash

id=$(i3-msg -t get_tree | jq -r '.nodes[].nodes[].nodes[].floating_nodes[].nodes[] | select(".window_properties.name=1Password").id')
if [[ $id -gt 0 ]]; then
  echo "Focusing 1password"
  i3-msg -q '[class="^1Password"] scratchpad show'
else
  echo "Starting 1Password"
  1password > /tmp/1password & disown;
  id=$(i3-msg -t get_tree | jq -r '.nodes[].nodes[].nodes[].floating_nodes[].nodes[] | select(".window_properties.name=1Password").id')
  while [[ $id -lt 1 ]]; do
    id=$(i3-msg -t get_tree | jq -r '.nodes[].nodes[].nodes[].floating_nodes[].nodes[] | select(".window_properties.name=1Password").id')
  done
  i3-msg -q '[con_id="'$id'"] move scratchpad'
  i3-msg -q '[class="^1Password"] scratchpad show'
fi


