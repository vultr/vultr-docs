#!/bin/bash

######################
## per-boot setup script
######################

## Write datestamp to a log file to demonstrate the script ran.
echo $(date -u) : System booted. >> /var/log/per-boot.log

## Add any steps that should run on every boot. 