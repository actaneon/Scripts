#!/bin/bash
#  rsync -avz -e ssh --exclude db.php wiaawi.org:htdocs .

BACKUP_USER=root
BACKUP_HOST=mog.darkops.net
BACKUP_PATH=/data/backup/system/

#ntpdate clock.psu.edu > /dev/null

# ping -c 1 $BACKUP_HOST 1>& /dev/null
# RETVAL=$?

# if [ $RETVAL != 0 ]; then
#   /usr/local/bin/wakelan 00:40:63:CC:11:86
#   sleep 2m 
# fi


ping -c 1 $BACKUP_HOST 1>& /dev/null
RETVAL=$?

if [ $RETVAL = 0 ]; then
  tar cjpv \
    --exclude="*/.Trash*" \
    --exclude="*/Desktop*" \
    --exclude="*/Movies*" \
    --exclude="*/Music*" \
    --exclude="*/Library/Caches*" \
    --exclude="*/Library/Fonts*" \
    /Users/jking/ | ssh $BACKUP_USER@$BACKUP_HOST "dd of=$BACKUP_PATH$HOSTNAME-`date +%y%m%d`.tar.bz2" > /dev/null

  sleep 30s
fi

#foo=`ssh -i /home/backup/.ssh/id_dsa backup@chrome.darkops.net "ls -alh /data/backup/system/$HOSTNAME-*.tar.bz2"`

#ssh -i /root/.ssh/id_dsa root@chrome.darkops.net "halt"

#echo $foo | mail -s "Backup of $HOSTNAME Complete" jking@darkops.net 

#ssh root@chrome.darkops.net "stat locke.darkops.net-060526.tar.bz2   | grep Size  | cut -d ':' -f2 | cut -d ' ' -f 2" | mail -s "$HOSTNAME backup complete" cell@darkops.net
