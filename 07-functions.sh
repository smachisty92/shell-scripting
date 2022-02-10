#!/bin/bash

# a set of data to a name is called as variable
# a set to commands to a name is called as function

#Declare a function

SAMPLE() {
  echo "Welcome to DevOps Training"
  echo "Welcome to DevOps Training"
  echo "Welcome to DevOps Training"
}
## Main Program
# Call the function
SAMPLE

SAMPLE1() {
  echo First Argument in Function = $1
}
echo First Argrument in Main Function = $1
SAMPLE1 ABC

#1. when you declare a variable in main program, then function can access it modify it
#2. when you declare a variable in function, then you can overwrite it in main program
#3. Function will not access special variable inputs given to script, only main program can access them. Meaning special variables from inputs aare different form function from main program
#4. Cases we need to come back immedialtely from functoin to main program, in that casre we use return command, retun command is like exit commant , wehre exit the script where as return with exits the functions.