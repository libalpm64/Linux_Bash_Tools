#!/bin/bash
tail -f /var/log/syslog | grep --line-buffered "ERROR" | while read line; do
    echo "Error found: $line"
done
