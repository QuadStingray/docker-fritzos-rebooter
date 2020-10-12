#!/bin/bash

IFS='|' read -r -a cronLinesArray <<< "$CRONS_LINES"

crontab -r

for index in "${!cronLinesArray[@]}"
do
    if [ "$LOGGING" = "true" ] || [ "$LOGGING" = "TRUE" ]; then
      crontab -l | { cat; echo "${cronLinesArray[index]} /scripts/fritzbox-reboot.sh > /var/log/fritzbox/reboot.log 2>&1"; } | crontab -
    else
      crontab -l | { cat; echo "${cronLinesArray[index]} /scripts/fritzbox-reboot.sh > /dev/null"; } | crontab -
    fi
done

mkdir /var/log/fritzbox/

crond -d 0

while true; do :; done & kill -STOP $! && wait $!
