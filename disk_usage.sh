#!/bin/bash

DISK_USAGE=$(df -hT| grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= readLine 
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)