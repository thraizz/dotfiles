#!/bin/bash
#$HOME/scripts/rsyncnfs.sh

source $HOME/.config/variables

set -x
pidfile=/tmp/"$(basename $0)".pid 
if [ -r "$pidfile" ]; then
#pkill -P "$(cat ${pidfile})"
kill -TERM -"$(cat ${pidfile})"
sleep 4
fi

# trap based on http://linuxcommand.org/wss0160.php
trap "rm $pidfile; exit" SIGHUP SIGINT SIGTERM EXIT

# to kill children via pkill -P "$(cat ${pidfile})"
echo $$ > "$pidfile"

logsdir=/tmp #/var/log
logbasename="$logsdir"/"$(basename $0)"
set -x
rsync -avAXHRP --delete -e 'ssh -i /home/dubai/.ssh/lan' --exclude-from $HOME/scripts/rsync-homedir-excludes.txt $HOME $BACKUPTARGET:/share/Backup/dubai
