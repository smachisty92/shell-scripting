#!/bin/bash

INSTANCE_ID=$1
if [ -z "${INSTANCE_ID}" ]; then
  echo -e "\e[1;33mInstacne name argument is needed\e[0m"
  exit
fi



AMI_ID=$(aws ec2 describe-images --filters "Name=name,Values=Centos-7-DevOps-Practice" --query 'Images[*].[ImageId]' --output text)

if [ -z "${AMI_ID}" ]; then
  echo "Unanble to find Image AMI_ID"
  exit
else
  echo AMI ID = ${AMI_ID}
fi

PRIVATE_IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${INSTANCE_ID} --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)


# if we want to run a instance
if [ -z "${PRIVATE_IP}" ]; then
  aws ec2 run-instances --image-id ${AMI_ID} --instance-type t3.micro --output text --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${INSTANCE_ID}}]"
else
  echo "Instanc ${INSTANCE_ID} is already exits, Henace not creating"
fi

