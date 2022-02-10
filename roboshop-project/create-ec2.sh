#!/bin/bash

AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z "${AMI_ID}" ]; then
  echo "Unanble to find Image AMI_ID"
else
  echo AMI ID = ${AMI_ID}
fi

# if we want to run a instance

aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro --output text

