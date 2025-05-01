#! /bin/bash
num1=$1
num2=$2

total=$((num1+num2))

echo "total is $total"

echo "number of args passed : $#"

echo "All args passed : $@"

echo "Script name is $0"