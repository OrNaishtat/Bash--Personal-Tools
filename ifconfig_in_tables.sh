#!/bin/bash
ifconfig | while read LINE ; do

echo $LINE | grep -q ^[a-z,A-Z,0-9]*': ' && printf "|Interface: \t" && echo $LINE | awk -F : '{print $1}'
echo $LINE | grep 'inet ' -q && printf "|IP: \t" && echo $LINE | awk '{print $2}'
echo $LINE | grep 'ether ' -q && printf "|MAC: \t" && echo -e "$LINE\n" | awk '{print $2}'

done
