#!/bin/bash

########################################################
## See 'simple-deploy.sh' to get started.
########################################################
OS_ID=387
REGION_ID=ewr
PLAN_ID=vc2-1c-1gb


########################################################
## The next 5 steps create a startup script.
########################################################
## Step 1: Create the script text.
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
## Step 3: Generate a unique script label.
SCRIPT_LABEL="X"
TEST_LABEL="X"
while [[ $SCRIPT_LABEL == $TEST_LABEL ]]
do
   SCRIPT_LABEL="Example"-$(LC_ALL=C tr -dc 'A-Z' </dev/urandom | head -c 6)
   TEST_LABEL=$(./vultr-cli script list | grep "$SCRIPT_LABEL" | awk '{print $NF}')
done
## Step 4: Add the script to your account with the unique label.
./vultr-cli script create --type boot --name "$SCRIPT_LABEL" --script=$B64SCRIPT >/dev/null 2>&1
## Step 5: Look for the unique label to find the Script ID.
SCRIPT_ID=$(./vultr-cli script list | grep "$SCRIPT_LABEL" | awk '{print $1}')


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
