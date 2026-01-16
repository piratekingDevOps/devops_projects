#!/bin/bash

#Total CPU usage

echo"########## CPU usage"
top -bn1 |grep -i "Cpu(s):"
echo"####################"

#Total memory usage
echo"########## Memory usage"
free -h
echo"####################"

#Total disk usage
echo"########## Disk usage"
df -h
echo"####################"

#Top 5 processes by cpu usage
echo"########## Top 5 processes by CPU usage"
ps aux --sort=-%cpu |head -n 6
echo"####################"

#Top 5 processes by memory usage
echo"########## Top 5 processes by Memory usage"
ps aux --sort=-%mem |head -n 6
echo"####################"
