#!/bin/bash

######################
# Author: HarryPotter
# Date: 12 Aug,2023
# Version: v1.0
# Description: AWS resource usage dashboard
######################

# AWS EC2 resource tracer

echo "Contents will be written here" > resourcetracker

echo "Printing ec2 resources" >> resourcetracker
aws ec2 describe-instances >> resourcetracker

# AWS S3 resource tracer

echo "Printing s3 resources" >> resourcetracker
aws s3 ls >> resourcetracker

# AWS IAM resource tracer

echo "Printing iam resources" >> resourcetracker
aws iam list-users >> resourcetracker

# AWS LAMBDA functions resource tracer

echo "Printing lamda-function resources" >> resourcetracker
aws lambda list-functions >> resourcetracker

###### THE END #######



