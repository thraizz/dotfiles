#!/bin/bash

while(true); do
    playerctl metadata --format "{{ artist }} - {{ title }}" > current_song.txt
    sleep 5
done
