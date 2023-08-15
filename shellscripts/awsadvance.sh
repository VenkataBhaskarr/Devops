#######################
## Title   : Writing a script to create three services and to connect these three services
## Author  : HarryPotter
## Version : 1
#######################

#### S3 ####

# creating a bucket 
aws s3 create-bucket --bucket testingviacli964
# granting permissions for lambda function to be invoked by s3 objects



#### END ###


#### IAM config ####

#### END ####



#### Lambda ####

# creation of lambda function
aws lambda create-function --function-name mytestingfunction964 --runtime python3.6 --handler lambdafunc.lambda_handler --zip-file ./Desktop/Miscellenous/lambda.zip --role
aws lambda add-permission --function-name mytestingfunction964 --statement-id s3-invoke --action "lambda:InvokeFunction" --principal s3.amazonaws.com --source-arn arn:aws:s3:::testingviacli964
aws lamda create-event-source-mapping --function-name mytestingfunction964 --event-source-arn arn:aws:sns:::mytestingtopic964

#### END ####



#### SNS ####

# creation of sns topic 
aws sns create-topic --name mytestingtopic964
# subscribing the arn topic via email to certain endpoint
aws sns subscribe --topic-arn arn:aws:sns:::mytestingtopic964 --protocol email  --notification-endpoint venkatabhaskarpuppala@gmail.com

#### END ####





