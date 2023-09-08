#!/bin/bash

region="ap-south-1"
your_account_id="580272304833"
ami_name="$AMI_NAME"

ami_list=$(aws ec2 describe-images \
  --region $region \
  --owners $your_account_id \
  --query 'Images[*].[Name]' \
  --output text)

if [[ $ami_list == *"$ami_name"* ]]; then
  echo "AMI with name $ami_name already exists. Exiting gracefully."
  exit 0
else
  echo "AMI with name $ami_name does not exist. Proceeding with Packer build."
fi
