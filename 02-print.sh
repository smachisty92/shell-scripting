#!/usr/bash

echo Hello World

## when we print some times we print errors and to grab attention of users, it is better to print in color

#Syntax : echo -e "\e[COLmMESS\[0m"

  # -e option to enable esc sequence \e
  # \e - to enable color
  # [COLm - COL is color number
  # \e[0m - Disable the color

# COl Name        Col Code
# RED             31
# Green           32
# Yellow          33
# Blue            34
# Magenta         35
# Cyan            36

echo -e "\e[31mRED\e[32mGREEN\e[33mYELLOW\e[34mBLUE\e[35mMAGENTA\e[36mCYAN\e[0m"

# Same color can be printed bold
# 1; is like bold
# $4; is underline

echo -e "\e[1;31mRED\e[1;32mGREEN\e[1;33mYELLOW\e[1;34mBLUE\e[1;35mMAGENTA\e[1;36mCYAN\e[0m"

echo -e "\e[4;31mRED\e[4;32mGREEN\e[4;33mYELLOW\e[4;34mBLUE\e[4;35mMAGENTA\e[4;36mCYAN\e[0m"