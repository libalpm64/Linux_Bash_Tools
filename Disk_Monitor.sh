#!/bin/bash
usage=$(df -h / | grep -vE '^Filesystem' | awk '{ print $5 }' | sed 's/%//g')
if [ $usage -ge 80 ]; then
    echo "Disk space critically low! Current usage: $usage%"
fi
