#!/bin/bash

#################################################
## Setup Packer build environment and create a Marketplace snapshot.
## Tested on an Ubuntu 20.04 instance with 1024MB Memory.
##
## See details: https://www.vultr.com/docs/vultr-marketplace-quickstart-guide
##
## Prerequisites:
##
## 1. Allow API access for this workstation.
##    https://my.vultr.com/settings/#settingsapi
##
## 2. Export your Vultr API Key before running this script.
##    Example:
##
##        # export VULTR_API_KEY=[your Vultr API key]
##
## Optional:
##
## Set PACKER_LOG=0 to disable logging.
##        # export PACKER_LOG=1
## Set the log path
##        # export PACKER_LOG_PATH=~/packer.log
##
#################################################

## Install HashiCorp Packer
dpkg -s packer &> /dev/null
if [ $? -ne 0 ]
then
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    apt-get update && sudo apt-get install packer
fi

## Switch to tmp
cd /tmp

## Install Vultr plugin for packer
if [ ! -f /tmp/packer-builder-vultr ]
then
    wget https://github.com/vultr/packer-builder-vultr/releases/download/v2.2.1/packer-builder-vultr_2.2.1_linux_64-bit.tar.gz
    tar -xvf packer-builder-vultr_2.2.1_linux_64-bit.tar.gz
    chmod +x /tmp/packer-builder-vultr
fi

## Download scripts and packer template
if [ ! -f /tmp/setup-snapshot.sh ]
then
    wget https://raw.githubusercontent.com/vultr/vultr-docs/main/faq/vultr-marketplace/apt/apt-setup.sh
fi

if [ ! -f /tmp/marketplace.json ]
then
    wget https://raw.githubusercontent.com/vultr/vultr-docs/main/faq/vultr-marketplace/apt/apt-marketplace.json
fi

## Build a snapshot in your Vultr account.
packer build /tmp/apt-marketplace.json
