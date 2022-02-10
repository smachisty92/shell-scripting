#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]; then
  echo -e "\e[1;31m you should be root user to execute this script...\e[0m"
  exit
fi


if [ -f components/$1.sh ]; then
  bash components/$1.sh
else
  echo "wrong input"
  echo "Available Inputs - frontend|mongobb|cart|catalogue|commom|dispatch|mysql|payment|rabbitmq|redis|shipping|user"
fi
