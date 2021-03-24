#!/bin/bash

################################################
## Prepare server snapshot for Marketplace
## Tested on Ubuntu 20.04
################################################

## Clean the temporary directories, SSH keys, logs, history, etc.
rm -rf /tmp/*
rm -rf /var/tmp/*
rm -f /root/.ssh/authorized_keys /etc/ssh/*key*
touch /etc/ssh/revoked_keys
chmod 600 /etc/ssh/revoked_keys

## Clean the logs.
find /var/log -mtime -1 -type f -exec truncate -s 0 {} \;
rm -rf /var/log/*.gz
rm -rf /var/log/*.[0-9]
rm -rf /var/log/*-????????
echo "" >/var/log/auth.log

## Clean old cloud-init information.
rm -rf /var/lib/cloud/instances/*

## Clean the session history.
history -c
cat /dev/null > /root/.bash_history
unset HISTFILE

## Update the mlocate database.
/usr/bin/updatedb

## Wipe random seed files.
rm -f /var/lib/systemd/random-seed

## Distributions that use systemd should wipe the machine identifier to prevent boot problems.
rm -f /etc/machine-id
touch /etc/machine-id

## Clear the login log history.
cat /dev/null > /var/log/lastlog
cat /dev/null > /var/log/wtmp

## Wipe unused disk space with zeros for security and compression.
echo "Clearing free disk space. This may take several minutes."
dd if=/dev/zero of=/zerofile status=progress
sync
rm /zerofile
sync
