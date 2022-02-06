# shell-scripting


## Sed editor

#Sed with -i edit the file
#sed without -i will print the change on output
# -e is for multiple conditions in sed command
# -e cond1 -e cond2

#'''bash
#  search and replace /Subsctiute

#sed -i -e 's/root/ROOT/g' -e 's/admin/ADMIN/g' sample.txt

# DElete lines and Add lines

#sed -i -e '1d' -e '/root/ d' sample.txt

#sed -i -e '/root/ 1 Hello world' sample.txt
#sed -i -e '1 a Hello World' sample.txt
#sed -i -e '1 c Hellow world' sample.txt
#'''