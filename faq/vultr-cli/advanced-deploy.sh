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

########################################################
## See 'simple-deploy.sh' to get started.
## Select a small Ubuntu 20.04 instance in New Jersey.
########################################################
OS_ID=387
REGION_ID=ewr
PLAN_ID=vc2-1c-1gb

########################################################
## Generate a unique label, which is used to set the
## instance label, tag, and hostname.
## It's also used to identify the startup script and
## create a unique SSH key in ~/.ssh for this example.
########################################################
UNIQUE_LABEL="X"
TEST_LABEL="X"
while [[ $UNIQUE_LABEL == $TEST_LABEL ]]
do
   UNIQUE_LABEL="Vultr-Demo"-$(LC_ALL=C tr -dc '0-9' </dev/urandom | head -c 6)
   TEST_LABEL=$(vultr-cli script list | grep "$UNIQUE_LABEL" | awk '{print $NF}')
done

echo "Creating resources for $UNIQUE_LABEL"
########################################################
## The next four steps create a startup script.
########################################################

## Step 1: Create the script.
## For example, add your Vultr API key to root profile.
SCRIPT_TEXT="
#!/bin/sh
echo 'export VULTR_API_KEY=$VULTR_API_KEY' >> /root/.profile
"

## Step 2: Base64 encode the script.
## macOS and Linux have different base64 parameters.
if [[ "$OSTYPE" == "linux-gnu"* ]]
then
  SCRIPT_B64=`echo "$SCRIPT_TEXT" | base64 -w 0`
elif [[ "$OSTYPE" == "darwin"* ]]
then
  SCRIPT_B64=`echo "$SCRIPT_TEST" | base64`
else
  echo "This script requires Linux or macOS."
  exit 1
fi

## Step 3: Add the script to your account with the unique label.
vultr-cli script create --type boot --name "$UNIQUE_LABEL" --script="$SCRIPT_B64" >/dev/null 2>&1

## Step 4: Look for the unique label to find the Script ID.
SCRIPT_ID=$(vultr-cli script list | grep "$UNIQUE_LABEL" | awk '{print $1}')

########################################################
## The next four steps create the SSH key.
## In this example, the key is created in the temp folder.
########################################################

## Step 1: Generate a new SSH key in the temp folder.
ssh-keygen -q -t rsa -f ${TMPDIR:=/tmp}/$UNIQUE_LABEL-SSH-KEY -N '' <<< ""$'\n'"y" 2>&1 >/dev/null
if [[ ! -f ${TMPDIR:=/tmp}/$UNIQUE_LABEL-SSH-KEY ]]
then
  echo "Unable to create SSH key: ${TMPDIR:=/tmp}/$UNIQUE_LABEL-SSH-KEY"
  exit 1
else
  echo "Created SSH key."
  SSH_PUB_KEY=$(<${TMPDIR:=/tmp}/$UNIQUE_LABEL-SSH-KEY.pub)
fi

## Step 2: Add the SSH key to Vultr.
vultr-cli ssh-key create --name $UNIQUE_LABEL --key "$SSH_PUB_KEY" 2>&1 >/dev/null

## Step 3: Look for the unique label to find the Key ID.
KEY_ID=$(vultr-cli ssh-key list | grep "$UNIQUE_LABEL" | awk '{print $1}')

###################################################
## Deploy the instance.
###################################################
INSTANCE_ID=$(vultr-cli instance create \
    --os $OS_ID \
    --region $REGION_ID \
    --plan $PLAN_ID \
    --script-id $SCRIPT_ID \
    --ssh-keys $KEY_ID \
    --host $UNIQUE_LABEL \
    --label $UNIQUE_LABEL \
    --tag $UNIQUE_LABEL | grep "^ID" | awk '{print $2}');

if [[ -z "$INSTANCE_ID" ]]
then
  echo "Instance creation failed."
  exit 1
fi

## Wait for the instance to fully deploy.
INSTANCE_STATUS=""
echo "Waiting for instance to deploy."
while [[ $INSTANCE_STATUS != "ok" ]]
do
  sleep 30
  INSTANCE_STATUS=$(vultr-cli instance get $INSTANCE_ID | grep "SERVER STATE" | awk '{print $NF}')
  echo "Instance status = $INSTANCE_STATUS. Sleeping 30 seconds."
done

## Retreive the Main IP address.
MAIN_IP=$(vultr-cli instance get $INSTANCE_ID | grep "^MAIN IP" | awk '{print $3}')
echo ""
echo "Instance main IP =" $MAIN_IP 

## SSH to instance with SSH key.
echo "Connecting to the instance via SSH."
echo "The instance will be destroyed when you disconnect."
echo ""
ssh -i ${TMPDIR:=/tmp}/$UNIQUE_LABEL-SSH-KEY \
             -o StrictHostKeyChecking=no \
             -o UserKnownHostsFile=/dev/null \
             -o Loglevel=QUIET \
             root@$MAIN_IP

## Clean up resources.
echo "Cleaning up after SSH session."
echo ""
echo "Deleting resources for:" $UNIQUE_LABEL
echo ""
vultr-cli instance delete $INSTANCE_ID
vultr-cli script delete $SCRIPT_ID
vultr-cli ssh-key delete $KEY_ID
echo ""
echo "Script is complete."
