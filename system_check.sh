#!/bin/bash

echo "===== SYSTEM MONITOR ====="

echo "Current user:"
whoami

echo "Hostname:"
hostname

echo "Date and time:"
date

echo "System uptime:"
uptime

echo "Disk usage:"
df -h

echo "Memory usage:"
free -h

disk_usage=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo "Root filesystem usage: ${disk_usage}%"

if [ "$disk_usage" -gt 80 ]; then
    echo "WARNING: Root filesystem usage is above 80%!"
else
    echo "Disk usage is within the configured limit."
fi

echo "===== MONITORING COMPLETE ====="
