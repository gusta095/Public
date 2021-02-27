import boto3

REGION_NAME = 'us-east-1'
AWS_PROFILE = 'default'

ids = ['i-0c96af7bb8ce1e9f7']

def aws_ec2_stop():
    EC2 = boto3.resource('ec2')
    EC2.instances.filter(InstanceIds = ids).stop() 

def aws_ec2_start():
    EC2 = boto3.resource('ec2')
    EC2.instances.filter(InstanceIds = ids).start() 

def aws_ec2_terminate():
    EC2 = boto3.resource('ec2')
    EC2.instances.filter(InstanceIds = ids).terminate()