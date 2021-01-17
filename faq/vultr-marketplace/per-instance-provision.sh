#!/bin/bash

######################
## per-instance provisioning script
######################

## Write datestamp to a log file to demonstrate the script ran.
echo $(date -u) : System provisioned. >> /var/log/per-instance.log

## Add your provisioning steps that should run on the first (and ONLY the first) boot of a new instance. 