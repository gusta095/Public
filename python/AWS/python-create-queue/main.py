import boto3
import json
import sys
import os

QUEUE_NAME = str(sys.argv[1])
REGION_NAME = 'us-east-1'
AWS_PROFILE = os.getenv('AWS_PROFILE')

def create_sqs_queue_dlq():
    
    SQS_SET = boto3.client('sqs')
    SQS = boto3.resource('sqs')
    QUEUE_NAME_DLQ = (f'{QUEUE_NAME}-dlq')

    CREATE_DLQ = SQS.create_queue(QueueName = QUEUE_NAME_DLQ, Attributes = {'DelaySeconds': '5', 'VisibilityTimeout': '30', 'MessageRetentionPeriod': '1209600'})
    INFO = CREATE_DLQ.url[28:40]
    print(CREATE_DLQ.url)

    AWS_ACCOUNT_ID = INFO
    AWS_SQS_ARN = (f'arn:aws:sqs:{REGION_NAME}:{AWS_ACCOUNT_ID}:{QUEUE_NAME_DLQ}')
    AWS_QUEUE_URL = (f'https://queue.amazonaws.com/{AWS_ACCOUNT_ID}/{QUEUE_NAME}')

    CREATE = SQS.create_queue(QueueName = QUEUE_NAME, Attributes = {'DelaySeconds': '5', 'VisibilityTimeout': '30', 'MessageRetentionPeriod': '1209600'})
    print(CREATE.url)

    policy = {
        'deadLetterTargetArn': AWS_SQS_ARN,
        'maxReceiveCount' : '10'
    }
    policy = json.dumps(policy)

    try:
        SET = SQS_SET.set_queue_attributes(QueueUrl = AWS_QUEUE_URL, Attributes = {'RedrivePolicy': policy})
    except:
        print('ERROR')
        print(SET)
    else:
        print('CREATE SUCCESS')


TEST = str(input(f'Vai ser criado em {AWS_PROFILE} mesmo y/n ??: '))

if TEST == 'y' or TEST == 'Y':
    create_sqs_queue_dlq()
else:
    print('Foi cancelado')
















