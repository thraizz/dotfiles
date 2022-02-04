#!/bin/bash

ELGATO=$(v4l2-ctl  --list-devices | grep -A 1 "Cam Link" | grep /dev/video | xargs)
if [[ $ELGATO == "" ]]; then
  ELGATO="/dev/video4"
  echo "[!] No video device named 'Cam Link' found, falling back to $ELGATO"
fi
# Remember to modprobe v4l2loopback:
# sudo modprobe v4l2loopback exclusive_caps=1 card_label="Virtual Webcam" max_buffers=2
V4LOOP=$(v4l2-ctl  --list-devices | grep -A 1 "Virtual Webcam" | grep /dev/video | xargs)

ffmpeg -f v4l2 -input_format yuv420p -framerate 60 -video_size 1920x1080 -i $ELGATO -pix_fmt yuv420p -codec copy -f v4l2 $V4LOOP
