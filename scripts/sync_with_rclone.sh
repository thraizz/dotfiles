#!/bin/bash

rclone sync /home/arons/studium remote:Studium
rclone sync remote:Studium /home/arons/studium

rclone sync /home/arons/buecher remote:Buecher
rclone sync remote:Buecher /home/arons/buecher

rclone sync /home/arons/notes remote:Notizen
rclone sync /home/arons/notes dropbox:Notizen
rclone sync remote:Notizen /home/arons/notes
rclone sync dropbox:Notizen /home/arons/notes
