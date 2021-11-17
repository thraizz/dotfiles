#!/bin/bash

ELGATO=/dev/video0
V4LOOP=/dev/video2

ffmpeg -f v4l2 -input_format yuyv422 -framerate 30 -video_size 1920x1080 -i $ELGATO -pix_fmt yuyv422 -codec copy -f v4l2 $V4LOOP
