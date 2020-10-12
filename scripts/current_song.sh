#!/bin/bash
artist=$(playerctl metadata --format "{{artist}}")
title=$(playerctl metadata --format "{{title}}")

s=""

titlelength=$(echo $title | awk '{print length}')
if [ $titlelength -gt 2 ]; then
  if [ $titlelength -gt 10 ]; then
    s=$(echo $title | cut -d' ' -f1-4)
  else
    s=$title
  fi
fi

artistlength=$(echo $artist | awk '{print length}')
if [ $artistlength -gt 2 ]; then
  if [ $artistlength -gt 10 ]; then
    s=$s' - '$(echo $artist | cut -d' ' -f1-4)
  else
    s=$s' - '$artist
  fi
fi
strlen=$(echo $s | awk '{print length}')
if [ $strlen -eq 0 ]; then
  s="No player found."
fi
echo $s
