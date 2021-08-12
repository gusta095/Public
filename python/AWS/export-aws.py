import boto3

# REGION_NAME = 'us-east-1'
# AWS_PROFILE = 'XXXXXXXX'

def describe_ec2():
    client = boto3.client('ec2')
    while True:
        describe = client.describe_instances()
        for reservation in describe['Reservations']:
            for ec2 in reservation['Instances']:
                print(f"""
                Instance: {ec2['InstanceId']}
                Instance type : {ec2['InstanceType']}
                Private DNS : {ec2['PrivateDnsName']}
                Private IP : {ec2['PrivateIpAddress']}
                SubnetID : {ec2['SubnetId']}
                VPC : {ec2['VpcId']} """)

                for securityGroup in ec2['SecurityGroups']:
                    print(f""" 
                    Security Group ID: {securityGroup['GroupId']}
                    Security Name : {securityGroup['GroupName']}""")
        break

import boto3

def describe_sg():
    client = boto3.client('ec2')
    while True:
        describe = client.describe_security_groups()
        for securitygroups in describe['SecurityGroups']:
            print(f"""
            Group Name: {securitygroups['GroupName']}
            Description: {securitygroups['Description']}
            GroupId: {securitygroups['GroupId']}
            VpcId: {securitygroups['VpcId']}
            Inbound rules: {securitygroups['IpPermissions']}
            Outbound rules: {securitygroups['IpPermissionsEgress']}""", file=open('arquivo.txt', 'a')) 
        break


