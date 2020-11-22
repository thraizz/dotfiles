#!/bin/bash
DATE=`date +%d.%m.%Y_%H:%M`
cd $HOME/Documents/Notes
git pull origin master --rebase --autostash
git add ./* -f
git commit -m "Synchronize notes: $DATE"
git push origin master

