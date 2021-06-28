#!/usr/bin/env sh

# Run processes
sudo ps --user www-data

# Kill processes
killall kinsing kdevtmpfsi

# List files in tmp dirs
ls -laF /tmp /var/tmp

# Delete
find / -iname kdevtmpfsi -exec rm -fv {} \;
find / -iname kinsing -exec rm -fv {} \;

# Cleanup tmp dirs
rm -rf /tmp/* /tmp/.* /var/tmp/* /var/tmp/.*