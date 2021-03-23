import boto3

REGION_NAME = 'us-east-1'
AWS_PROFILE = 'default'

SNS_NAME = 'gusta-sns'
TOPICS = 'arn:aws:sns:us-east-1:123456789:gusta-sns'

def create_topic():
    SNS = boto3.client('sns')
    CREATE_TOPIC = SNS.create_topic(Name = SNS_NAME)
    print(CREATE_TOPIC)

def delete_topic():
    SNS = boto3.client('sns')
    DELETE_TOPIC = SNS.delete_topic(TopicArn = TOPICS)
    print(DELETE_TOPIC)

def list_topic():
    SNS = boto3.client('sns')
    LIST_TOPIC = SNS.list_topics()
    print(LIST_TOPIC['Topics'])

def add_permission_topic():
    SNS = boto3.client('sns')
    ADD_PERMISSION = SNS.add_permission()
    print(ADD_PERMISSION['Topics'])


