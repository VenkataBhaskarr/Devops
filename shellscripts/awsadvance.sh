#######################
## Title   : Writing a script to create three services and to connect these three services
## Author  : HarryPotter
## Version : 1
#######################

#!/bin/bash

## This id is used to construct further ARN's
AWS_ACCOUNT_ID = $(aws sts get-caller-identity --query 'Account' --output text)
BUCKER_NAME    = "bhaskar-ultimate-bucket-bro"
FUNCTION_NAME  = "bhaskar-ultimate-function-bro"
EMAIL_ADDRESS  = "venkatabhaskarpuppala@gmail.com"
ROLE_NAME      = "s3-lambda-sns"

# Creating an IAM role for this project

role_response=$(aws iam create-role --role-name s3-lambda-sns --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "sts:AssumeRole",
    "Effect": "Allow",
    "Principal": {
      "Service": [
         "lambda.amazonaws.com",
         "s3.amazonaws.com",
         "sns.amazonaws.com"
      ]
    }
  }]
}')
role_arn = $(echo "$role_response") | jq -r '.Role.Arn'
aws iam attach-role-policy --role-name "$ROLE_NAME" --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess
aws iam attach-role-policy --role-name "$ROLE_NAME" --policy-arn arn:aws:iam::aws:policy/AmazonSNSFullAccess
## Creating S3 bucket

s3_bucket = $(aws s3api create-bucket --bucket "$BUCKET_NAME")

# creating a zip 

zip -r s3-lambda-function.zip ./s3-lambda-function
sleep(2)

## Creating lambda function

lambda_function = $(aws lambda create-function --function-name "$FUNCTION_NAME" --runtime python3.6 --zip-file "fileb://./s3-lambda-function.zip" --handler "s3-lambda-function/s3-lambda-function.lambda_handler" --role "$role_arn")
aws lambda add-permission --function-name "$FUNCTION_NAME" --statement-id "s3-lambda-sns" --action "lambda:InvokeFunction" --principal s3.amazonaws.com --source-arn "arn:aws:s3:::$BUCKET_NAME"
LambdaFunctionArn="arn:aws:lambda:us-east-1:$aws_account_id:function:lambda-function"
aws s3api put-bucket-notification-configuration \
  --bucket "$bucket_name" \
  --notification-configuration '{
    "LambdaFunctionConfigurations": [{
        "LambdaFunctionArn": "'"$LambdaFunctionArn"'",
        "Events": ["s3:ObjectCreated:*"]
    }]
}'


## Creating SNS service

sns_service_arn  = &(aws sns create-topic --name my-sns-lambda --output json | jq -r '.TopicArn')

# Add SNS publish permission to the Lambda Function
aws sns subscribe \
  --topic-arn "$sns_service_arn" \
  --protocol email \
  --notification-endpoint "$EMAIL_ADDRESS"






