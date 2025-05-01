ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"


validate(){
     if [ $1 -ne 0 ]
then
    echo -e " ERROR:  is $R failed $N"
    exit 1
else
    echo -e "$2 is $G success $N"
fi

}
if [ $ID -ne 0 ]
then
    echo -e "$R please run this with root user $N"
    exit 1 # you can give other than 0
else
    echo -e "$G you are root user $N"
fi

yum install mysql -y &>> $LOGFILE

validate $? "installing mysql"

yum install git -y &>> $LOGFILE

validate $? "installing git"

