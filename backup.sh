#!/bin/sh
filename = "$1"
serverip = ""

while read -r line
do
    $serverip = $line
done < "$filename"
echo "$serverip"
#echo "Syncing GIT repos..."
#sh update-lconf.sh
#sh git-sync.sh
#echo "Done"
echo "Syncing backup folder..."
cp -r ~/Pictures ~/Backup
cp -r ~/notes ~/Backup
cp -r ~/Documents ~/Backup
echo "Done"

echo "Moving Backup folder upstream"
scp -r ~/Backup Git@$serverip:~/Backup
echo "Done"
