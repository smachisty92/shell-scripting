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


if [ -z "$c" ]; then
    echo c is empty
fi