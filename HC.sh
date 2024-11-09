#!/bin/bash

# Date and time when the script is run
echo "Health Check Report - $(date)"

# System Uptime
echo -e "\nSystem Uptime:"
uptime

# CPU Usage
echo -e "\nCPU Usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Usage: " 100 - $1"%"}'

# Memory Usage
echo -e "\nMemory Usage:"
free -h

# Disk Space Usage
echo -e "\nDisk Space Usage:"
df -h

# Network Status
echo -e "\nNetwork Status:"
ifconfig

# Running Processes
echo -e "\nRunning Processes:"
ps aux --sort=-%cpu | head -n 10

echo -e "\nHealth check complete."

