#! /bin/bash/

tstmp = `date '+%Y-%m-%d_%H:%M'`
cat /var/log/syslog | awk 'tolower($0) ~!/sudo/ && tolower($0) ~/cron/ {print $0;}' | awk 'NF < 13' >> ~/home/xhazimix/modul1/syslog_$tstmp.log
