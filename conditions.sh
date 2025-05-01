#! /bin/bash
num=$1

if [ $num -gt 100 ]
then
    echo "number is greater than 100"
else    
    echo "number is not grretaet than 100"

fi 

#echo "total is $total"

echo "number of args passed : $#"

echo "All args passed : $@"

echo "Script name is $0"