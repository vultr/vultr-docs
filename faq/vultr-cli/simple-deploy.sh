#!/bin/bash

########################################################
## PREREQUISITES
##
## 1. Export your Vultr API key.
##        export VULTR_API_KEY=<your API key>
##
## 2. Add your IP address to the Access Control list.
##        https://my.vultr.com/settings/#settingsapi
##
## 3. Install 'vultr-cli' in your path.
##        https://github.com/vultr/vultr-cli#installation
########################################################

## Select an OS
OS_ID=387
########################################################
## 'vultr-cli os list' as of Feb 1, 2021
########################################################
# ID      NAME                    ARCH    FAMILY
# 381     CentOS 7 SELinux x64    x64     centos
# 167     CentOS 7 x64            x64     centos
# 401     CentOS 8 Stream x64     x64     centos
# 362     CentOS 8 x64            x64     centos
# 352     Debian 10 x64 (buster)  x64     debian
# 194     Debian 8 i386 (jessie)  i386    debian
# 244     Debian 9 x64 (stretch)  x64     debian
# 389     Fedora 32 x64           x64     fedora
# 415     Fedora 33 x64           x64     fedora
# 391     Fedora CoreOS           x64     fedora-coreos
# 230     FreeBSD 11 x64          x64     freebsd
# 327     FreeBSD 12 x64          x64     freebsd
# 394     OpenBSD 6.7 x64         x64     openbsd
# 412     OpenBSD 6.8 x64         x64     openbsd
# 216     Ubuntu 16.04 i386       i386    ubuntu
# 215     Ubuntu 16.04 x64        x64     ubuntu
# 270     Ubuntu 18.04 x64        x64     ubuntu
# 387     Ubuntu 20.04 x64        x64     ubuntu
# 413     Ubuntu 20.10 x64        x64     ubuntu
# 124     Windows 2012 R2 x64     x64     windows
# 240     Windows 2016 x64        x64     windows
# 186     Application             x64     application
# 180     Backup                  x64     backup
# 159     Custom                  x64     iso
# 426     Marketplace App         x64     marketplace_app
# 164     Snapshot                x64     snapshot

## Select a region
REGION_ID=ewr
########################################################
## 'vultr-cli regions list' as of Feb 1, 2021
########################################################
# ID      CITY            COUNTRY         CONTINENT       OPTIONS
# ams     Amsterdam       NL              Europe          [ddos_protection]
# atl     Atlanta         US              North America   []
# cdg     Paris           FR              Europe          [ddos_protection]
# dfw     Dallas          US              North America   [ddos_protection]
# ewr     New Jersey      US              North America   [ddos_protection block_storage]
# fra     Frankfurt       DE              Europe          [ddos_protection]
# icn     Seoul           KR              Asia            []
# lax     Los Angeles     US              North America   [ddos_protection]
# lhr     London          GB              Europe          [ddos_protection]
# mia     Miami           US              North America   [ddos_protection]
# nrt     Tokyo           JP              Asia            []
# ord     Chicago         US              North America   [ddos_protection]
# sea     Seattle         US              North America   [ddos_protection]
# sgp     Singapore       SG              Asia            []
# sjc     Silicon Valley  US              North America   [ddos_protection]
# syd     Sydney          AU              Australia       []
# yto     Toronto         CA              North America   []

## Select a plan
PLAN_ID=vc2-1c-1gb
########################################################
## 'vultr-cli plans list' as of Feb 1, 2021
########################################################
# ID              VCPU  RAM    DISK  BANDWIDTH  PRICE  TYPE  REGIONS
# vc2-1c-1gb      1     1024   25    1024       5      vc2   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt icn mia sgp]
# vc2-1c-2gb      1     2048   55    2048       10     vc2   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt icn mia sgp]
# vc2-2c-4gb      2     4096   80    3072       20     vc2   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt icn mia sgp]
# vc2-4c-8gb      4     8192   160   4096       40     vc2   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt icn mia sgp]
# vc2-6c-16gb     6     16384  320   5120       80     vc2   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt mia sgp]
# vc2-8c-32gb     8     32768  640   6144       160    vc2   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt mia sgp]
# vc2-16c-64gb    16    65536  1280  10240      320    vc2   [ord dfw sea lax atl ams lhr fra sjc syd cdg mia]
# vc2-24c-96gb    24    98304  1600  15360      640    vc2   [atl lhr fra sjc cdg mia]
# vdc-4vcpu-8gb   2     8192   110   10240      60     vdc   [ewr sjc]
# vdc-4vcpu-16gb  4     16384  110   20480      120    vdc   [ewr]
# vdc-6vcpu-24gb  6     24576  110   30720      180    vdc   [ewr]
# vdc-8vcpu-32g   8     32768  110   40960      240    vdc   [ewr]
# vhf-1c-1gb      1     1024   32    1024       6      vhf   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt icn mia sgp]
# vhf-1c-2gb      1     2048   64    2048       12     vhf   [ewr ord dfw sea lax atl ams lhr fra sjc syd yto cdg nrt icn mia sgp]
# vhf-2c-4gb      2     4096   128   3072       24     vhf   [ewr ord dfw sea lax atl lhr fra sjc syd yto nrt icn mia sgp]
# vhf-3c-8gb      3     8192   256   4096       48     vhf   [ewr ord dfw lax atl lhr fra sjc syd yto icn mia sgp]
# vhf-4c-16gb     4     16384  384   5120       96     vhf   [ewr ord dfw lax atl lhr fra syd icn mia sgp]
# vhf-6c-24gb     6     24576  448   6144       144    vhf   [ewr ord dfw lax atl lhr fra syd icn mia]
# vhf-8c-32gb     8     32768  512   7168       192    vhf   [ord dfw lax atl lhr fra syd icn mia]
# vhf-12c-48gb    12    49152  768   8192       256    vhf   [ord dfw lax fra syd icn]

###################################################
## Deploy the instance. For example:
##
##     vultr-cli instance create --os 387 --region ewr --plan vc2-1c-1gb
##
## The CLI returns the Instance ID in the second
## column of the line that begins with 'ID'.
##
## Pipe the output through 'grep' to get the ID
## and use 'awk' to return the second column.
###################################################
INSTANCE_ID=$(vultr-cli instance create \
                          --os $OS_ID \
                          --region $REGION_ID \
                          --plan $PLAN_ID | grep "^ID" | awk '{print $2}');
if [[ -z "$INSTANCE_ID" ]]
then
  echo "Instance creation failed."
else
  echo "Instance ID =" $INSTANCE_ID
  echo "Waiting 60 seconds for instance to deploy."
  sleep 60
  ## Retreive the Main IP address.
  echo "Main IP =" $(vultr-cli instance get $INSTANCE_ID | grep "^MAIN IP" | awk '{print $3}');
fi
