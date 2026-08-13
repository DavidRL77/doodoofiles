#!/bin/sh
awww-daemon --no-cache &

# wait until the daemon is properly initialized
until awww query >/dev/null 2>&1 
do 
    sleep 0.05 
done

~/.config/swww/swww.sh
