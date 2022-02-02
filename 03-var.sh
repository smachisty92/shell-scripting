# Variable

Student_name="syed"

echo Student name is $Student_name

echo student name is ${Student_name}

# how to get the data dynamically

Date=2022-01-21
echo Good Morning, Today date is $Date

# to get dynamic data, we go with command subsitution and arthimatic

DATE=$(date +%F)
echo Good Morning, Today date is $Date


#Arthimatic subsitution

Expr1=$((1+1+10-2/2))
echo Expression is = $Expr1