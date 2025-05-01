#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo "please run this with root user"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo " ERROR: installing mysql is failed"
    exit 1
else
    echo "installing mysql is success"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo " ERROR: installing git failed"
    exit 1
else
    echo "installing git is success"
fi


