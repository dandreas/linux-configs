#!/bin/bash
# Pushes changes in set configs to the linux-configs git.
echo "This app will NOT ask you whether you wish to accept the changes being committed"
echo "To cancel the processes of this app hit CTRL + C before exiting the diff command"
echo "It may also be needed to rollback the files to a previous commit"

cp ~/.i3/config ~/Git/linux-configs
cp ~/.vimrc ~/Git/linux-configs
cp ~/update-lconf.sh ~/Git/linux-configs
cp ~/git-sync.sh ~/Git/linux-configs
cp ~/screenfix.sh ~/Git/linux-configs
cp ~/steamfix.sh ~/Git/linux-configs
cp ~/ssh-ips ~/Git/linux-configs
cp ~/ssh-ubuserver.sh ~/Git/linux-configs
cp ~/.i3blocks.conf ~/Git/linux-configs
cp ~/.tmux.conf ~/Git/linux-configs

cd ~/Git/linux-configs
git diff
git commit -a -m "auto-commit"
git push origin master
