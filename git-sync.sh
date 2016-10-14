#!/bin/bash
# This script syncs local git files with the local server.

echo If this connection fails, odds are either:
echo 1. The server IP changed
echo 2. The server is down
echo 
sudo scp -r ~/Git/ git@172.16.117.67:/home/git/

