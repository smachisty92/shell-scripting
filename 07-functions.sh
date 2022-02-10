#!/bin/bash

# a set of data to a name is called as variable
# a set to commands to a name is called as function

#Declare a function

SAMPLE() {
  echo "Welcome to DevOps Training"
}
## Main Program
# Call the function
SAMPLE

SAMPLE1() {
  echo First Argument in Function = $1
}
echo First Argrument in Main Function = $1
SAMPLE1