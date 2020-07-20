#!/bin/python

import subprocess

def callRofi(title="Pick one"):
    c =  'rofi -width 200 -lines 0 -location 0 -dmenu -p "{}" -padding 20 -line-margin 10'.format(title)
    proc = subprocess.Popen(c, shell=True,stdout=subprocess.PIPE)
    choice = proc.stdout.readline().decode("UTF-8")
    return choice[:-1]

time = callRofi("How long?")

c = 'urxvt -fn "xft:Monospace:pixelsize=24" -name timer -title timer -geometry 10x3 -e termdown {} --no-figlet'.format(time)
#c = c+"; i3-msg '[title=Timer] floating enable; sticky enable; resize set 200 80; move position 2000 100'"
subprocess.Popen(c, shell=True)
