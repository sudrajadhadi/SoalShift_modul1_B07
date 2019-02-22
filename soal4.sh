#!/bin/bash

A=ABCDEFGHIJKLMNOPQRSTUVWXYZ
B=abcdefghijklmnopqrstuvwxyz

a=($(echo ${A[@]})$(echo ${A[@]}))
b=($(echo ${B[@]})$(echo ${B[@]}))
hour=`date +"%H"`
x=$hour

data1=($(echo ${A[@]})$(echo ${B[@]}))
kata1=$(echo $A | tr "${A:0:26}" "${a:${x}:26}")
kata2=$(echo $B | tr "${B:0:26}" "${b:${x}:26}")
data2=($(echo ${kata1[@]})$(echo ${kata2[@]}))

nama_file=`date +"%H:%M %d-%m-%Y"`

< /var/log/syslog > "$nama_file" tr "$data1" "$data2"
