#!/bin/bash

## string comparision

a=abc1
if [ $a = "abc" ]
then
  echo OK
fi


# string

if [ $a != "abc" ]; then
    echo NOTOK
fi


if [ -z "$b" ]; then
    echo b is empty
fi