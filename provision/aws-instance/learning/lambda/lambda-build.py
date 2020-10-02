import boto3
import logging
import sys

def lambda_build():
    client = boto3.client('lambda')
    create_lambda_function = client.create_function()

create_lambda_function = client.create_function(
    FunctionName=LambdaFunctionName,
    Runtime='python3.7',
    Role=iamRole,
    Handler='{}.lambda_handler'.format('lambda_build'),
    Description='Start a virtual machine',
    Code={'S3Bucket': 'timemap-bucket', 'S3Key': 'lambda.zip'}
)

