#!/bin/bash

## Setup Packer build environment and create a Marketplace snapshot
## Tested on Ubuntu 20.04

#################################################
##
## Prerequisites: Update with your information.
##
#################################################
## Update with your API Key
export VULTR_API_KEY=xxxxxxx_MY_VULTR_API_KEY_xxxxxxx
## Set PACKER_LOG=1 to enable logging.
export PACKER_LOG=0
## Set to your preferred log path
export PACKER_LOG_PATH=~/Marketplace/packer.log


## Install HashiCorp Packer
dpkg -s packer &> /dev/null
if [ $? -ne 0 ] then
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    apt-get update && sudo apt-get install packer
fi

## Create a working folder
if [ ! -d ~/Marketplace ]
then
    mkdir ~/Marketplace
fi
cd ~/Marketplace

## Install Vultr plugin for packer
if [ ! -f ~/Marketplace/packer-builder-vultr ]
then
    wget https://github.com/vultr/packer-builder-vultr/releases/download/v2.0.1/packer-builder-vultr_2.0.1_linux_64-bit.tar.gz
    tar -xvf packer-builder-vultr_2.0.1_linux_64-bit.tar.gz
    chmod +x ~/Marketplace/packer-builder-vultr
fi

## Download scripts and packer template
if [ ! -f ~/Marketplace/per-boot-setup.sh ]
then
    wget https://raw.githubusercontent.com/dfinr/vultr-docs/main/faq/vultr-marketplace/per-boot-setup.sh
fi

if [ ! -f ~/Marketplace/per-instance-provision.sh ]
then
    wget https://raw.githubusercontent.com/dfinr/vultr-docs/main/faq/vultr-marketplace/per-instance-provision.sh
fi

if [ ! -f ~/Marketplace/setup-snapshot.sh ]
then
    wget https://raw.githubusercontent.com/dfinr/vultr-docs/main/faq/vultr-marketplace/setup-snapshot.sh
fi

if [ ! -f ~/Marketplace/marketplace.json ]
then
    wget https://raw.githubusercontent.com/dfinr/vultr-docs/main/faq/vultr-marketplace/marketplace.json
fi

## Build a snapshot in your Vultr account.
packer build marketplace.json
