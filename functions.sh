ID=$(id -u)

validate(){
     if [ $1 -ne 0 ]
then
    echo " ERROR:  is failed"
    exit 1
else
    echo "$2 is success"
fi

}
if [ $ID -ne 0 ]
then
    echo "please run this with root user"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi

yum install mysql -y

validate $? "installing mysql"

yum install git -y

validate $? "installing git"

