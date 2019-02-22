#!/bin/bash

hour=$(date +"%H")

if [[ ${hour:0:1} -eq 0 ]]
then
    hour=${hour:1:1}
fi

kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
syslog=$(</var/log/syslog)
syslog=$(echo "$syslog" | tr "${kecil:0:26}" "${kecil:${hour}:26}")

besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
nama_file=$(echo "$syslog" | tr "${besar:0:26}" "${besar:${hour}:26}")

thishour=$(date +"%H:%M %d-%m-%Y")
echo "$syslog" > "$nama_file".log
