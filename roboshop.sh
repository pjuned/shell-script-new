# #!/bin/bash

# AMI_ID=ami-0b4f379183e5706b9 
# SG_ID=sg-0544c498e225746f0
# ZONE_ID=Z0453211BMHVK8GNH9ST
# DOMAIN_NAME="aws76s.online"


# INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "cart" "payment" "shipping" "mysql" "dispatch" "web")

# for i in "${INSTANCES[@]}"
# do 
#     echo "instance is $i :"
#     if [ $i == "mongodb" ] || [ $i == "shipping" ] || [ $i == "mysql" ]
#     then
#         instance-type="t3.small"
#     else
#         instance-type="t2.micro"
#     fi
# done 

# #getting ip addr of the instances
# $IP_ADDRESS=$(aws ec2 run-instances --image-id ami-0b4f379183e5706b9 --instance-type $instance_type --subnet-id subnet-0123456789abcdef --security-group-ids sg-0544c498e225746f0 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query  'Instances[0].PrivateIPAddress' --output text)
# echo "$I: IP_ADDRESS"


# #creatign route53 records
# aws route53 change-resource-record-sets \
#   --hosted-zone-id $ZONE_ID
#  \
#   --change-batch '
#   {
#     "Comment": "Testing creating a record set"
#     ,"Changes": [{
#       "Action"              : "CREATE",
#       ,"ResourceRecordSet"  : {
#         "Name"              : "'$i'.'$DOMAIN_NAME'"
#         ,"Type"             : "CNAME"
#         ,"TTL"              : 1
#         ,"ResourceRecords"  : [{
#             "Value"         : "$IP_ADDRESS"
#         }]
#       }
#     }]
#   }
#   '


  #!/bin/bash

# AMI=ami-0b4f379183e5706b9 #this keeps on changing
# SG_ID=sg-0544c498e225746f0 #replace with your SG ID
# INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
# ZONE_ID=Z0453211BMHVK8GNH9ST # replace your zone ID
# DOMAIN_NAME="aws76s.online"

# for i in "${INSTANCES[@]}"
# do
#     if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
#     then
#         INSTANCE_TYPE="t3.small"
#     else
#         INSTANCE_TYPE="t2.micro"
#     fi

#     IP_ADDRESS=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids sg-087e7afb3a936fce7 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
#     echo "$i: $IP_ADDRESS"

#     #create R53 record, make sure you delete existing record
#     aws route53 change-resource-record-sets \
#     --hosted-zone-id $ZONE_ID \
#     --change-batch '
#     {
#         "Comment": "Creating a record set for cognito endpoint"
#         ,"Changes": [{
#         "Action"              : "UPSERT"
#         ,"ResourceRecordSet"  : {
#             "Name"              : "'$i'.'$DOMAIN_NAME'"
#             ,"Type"             : "A"
#             ,"TTL"              : 1
#             ,"ResourceRecords"  : [{
#                 "Value"         : "'$IP_ADDRESS'"
#             }]
#         }
#         }]
#     }
#         '
# done

#!/bin/bash

AMI=ami-09c813fb71547fc4f #this keeps on changing
SG_ID=sg-0544c498e225746f0 #replace with your SG ID
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
ZONE_ID=Z0453211BMHVK8GNH9ST # replace your zone ID
DOMAIN_NAME="aws76s.online"

for i in "${INSTANCES[@]}"
do
    if [ $i == "mongodb" ] || [ $i == "mysql" ] || [ $i == "shipping" ]
    then
        INSTANCE_TYPE="t3.small"
    else
        INSTANCE_TYPE="t2.micro"
    fi

    IP_ADDRESS=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids $SG_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].PrivateIpAddress' --output text)
    echo "$i: $IP_ADDRESS"

    #create R53 record, make sure you delete existing record
    aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID \
    --change-batch '
    {
        "Comment": "Creating a record set for cognito endpoint"
        ,"Changes": [{
        "Action"              : "UPSERT"
        ,"ResourceRecordSet"  : {
            "Name"              : "'$i'.'$DOMAIN_NAME'"
            ,"Type"             : "A"
            ,"TTL"              : 1
            ,"ResourceRecords"  : [{
                "Value"         : "'$IP_ADDRESS'"
            }]
        }
        }]
    }
        '
done