#!/bin/bash

read file

up=ABCDEFGHIJKLMNOPQRSTUVWXYZ
lo=abcdefghijklmnopqrstuvwxyz

x1=($(echo ${up[@]})$(echo ${up[@]}))
x2=($(echo ${lo[@]})$(echo ${lo[@]}))
hour=${file:0:2}
x=$hour

hasil1=($(echo ${A[@]})$(echo ${B[@]}))
kata1=$(echo $A | tr "${up:0:26}" "${x1:${x}:26}")
kata2=$(echo $B | tr "${lo:0:26}" "${x2:${x}:26}")
hasil2=($(echo ${kata1[@]})$(echo ${kata2[@]}))

< "$file" > "$file dec" tr "$hasil2" "$hasil1"
