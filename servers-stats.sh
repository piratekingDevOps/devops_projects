#!/bin/bash

#Total CPU usage
echo "####################"
echo "#################### CPU usage"
echo "####################"
top -bn1 |grep -i "Cpu(s):"
#echo "####################"

#Total memory usage
echo "####################"
echo "#################### Memory usage"
echo "####################"
free -h
#echo "####################"

#Total disk usage
echo "####################"
echo "#################### Disk usage"
echo "####################"
df -h
#echo "####################"

#Top 5 processes by cpu usage
echo "####################"
echo "#################### Top 5 processes by CPU usage"
echo "####################"
ps aux --sort=-%cpu |head -n 6
#echo "####################"

#Top 5 processes by memory usage
echo "####################"
echo "#################### Top 5 processes by Memory usage"
echo "####################"
ps aux --sort=-%mem |head -n 6
#echo "####################"
