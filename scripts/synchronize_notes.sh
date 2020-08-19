#!/bin/bash
DATE=`date +%d.%m.%Y_%H:%M`
cd /home/arons/.vim/bundle/vim-notes/misc/notes/user
git pull origin master --rebase --autostash
git add ./*
git commit -m "Synchronize notes: $DATE"
git push origin master

