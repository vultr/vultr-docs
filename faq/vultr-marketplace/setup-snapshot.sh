#!/bin/bash
set -eo pipfail

################################################
## Build example snapshot for Vultr Marketplace
## Tested on Ubuntu 20.04
################################################

######################
## Prerequisite steps
######################
## Verify the /tmp directory exists and has the proper permissions.
if [ ! -d /tmp ]
then
    mkdir /tmp
    chmod 1777 /tmp
fi
cd /tmp

## Update the server.
apt-get -y update
apt-get -y upgrade
apt-get -y autoremove
apt-get -y autoclean

######################
## Install vultr-support branch of cloud-init
######################
wget https://ewr1.vultrobjects.com/cloud_init_beta/cloud-init_universal_latest.deb
md5sum cloud-init_universal_latest.deb
apt-get update -y
apt install -y python3-pip
dpkg -i cloud-init_universal_latest.deb
apt-get install -f -y

## Create script folders for cloud-init
mkdir -p /var/lib/cloud/scripts/per-instance/
mkdir -p /var/lib/cloud/scripts/per-boot/

## Install the cloud-init scripts that Packer uploaded.
mv /tmp/per-instance-provision.sh /var/lib/cloud/scripts/per-instance/provision.sh
mv /tmp/per-boot-setup.sh /var/lib/cloud/scripts/per-boot/setup.sh

# Make the scripts executable
chmod +x /var/lib/cloud/scripts/per-instance/provision.sh
chmod +x /var/lib/cloud/scripts/per-boot/setup.sh

######################
## Prepare server snapshot for Marketplace
######################

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
echo
echo "Clearing free disk space. This may take several minutes."
echo
dd if=/dev/zero of=/zerofile status=progress
sync
rm /zerofile
sync
echo
echo "Setup is complete. Begin snapshot process."
echo
