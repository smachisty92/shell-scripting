#!/bin/bash

if [ -f components/$1.sh ]; then
  bash components/$1.sh
else
  echo "wrong input"
  echo "Available Inputs - frontend|mongobb|cart|catalogue|commom|dispatch|mysql|payment|rabbitmq|redis|shipping|user"
fi
