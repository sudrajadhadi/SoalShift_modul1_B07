#! /bin/bash/

cat /var/log/syslog | awk 'tolower($0) ~!/sudo/ && tolower($0) ~/cron/ {print $0;}' | awk 'NF < 13' >> /home/xhazimix/modul1/user.log
