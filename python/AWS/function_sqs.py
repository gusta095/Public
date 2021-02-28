import boto3
import json

REGION_NAME = 'us-east-1'
AWS_PROFILE = 'default'

def simple_list_sqs_queue():
    ACESSO_AWS = boto3.session.Session(profile_name=AWS_PROFILE)
    SQS = ACESSO_AWS.resource(service_name="sqs",region_name=REGION_NAME)
    QUEUES = SQS.queues.all()
    for q in QUEUES:
        print(q.url[41:200])

def list_sqs_queue():
    ACESSO_AWS = boto3.session.Session(profile_name=AWS_PROFILE)
    SQS = ACESSO_AWS.resource(service_name="sqs",region_name=REGION_NAME)
    QUEUES = SQS.queues.all()
    for q in QUEUES:
        if 'test' in q.url:
            print(q.url[41:200])

def create_sqs_queue():
    SQS = boto3.resource('sqs')
    CREATE = SQS.create_queue(QueueName = 'queue_name', Attributes = {'DelaySeconds': '5', 'VisibilityTimeout': '30', 'MessageRetentionPeriod': '1209600'})
    print(CREATE.url)

def delete_sqs_queue():
    SQS = boto3.client('sqs')
    DELETE = SQS.delete_queue(QueueUrl = 'url_queue')
    print(DELETE)

def create_sqs_queue_dlq():
    
    SQS_SET = boto3.client('sqs')
    SQS = boto3.resource('sqs')
    QUEUE_NAME = 'gusta-teste'
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
        print('SUCCESS SET DLQ')

def send_mensage_sqs_queue():
    SQS = boto3.client('sqs')
    QUEUE_URL = 'queue_url'

    response = SQS.send_message(QueueUrl = QUEUE_URL, DelaySeconds = 10, 
    MessageBody = (
        'Information about current NY Times fiction bestseller for '
        'week of 12/11/2016.'
    )
    )
    print(response['MessageId'])


def received_mensage_sqs_queue():
    SQS = boto3.client('sqs')
    QUEUE_URL = 'queue_url'

    PAYLOAD = SQS.receive_message(QueueUrl = QUEUE_URL, AttributeNames = ['SentTimestamp'],MaxNumberOfMessages = 1,MessageAttributeNames = ['All'],VisibilityTimeout=0,WaitTimeSeconds=0)
    MENSAGE_ID = PAYLOAD['Messages'][0]['MessageId']
    MENSAGE_BODY = PAYLOAD['Messages'][0]['Body']

    print(f'''
    MensageID: {MENSAGE_ID}
    Body: 
    {MENSAGE_BODY}
    ''')

def received_delete_mensage_sqs_queue():
    SQS = boto3.client('sqs')
    QUEUE_URL = 'queue_url'

    PAYLOAD = SQS.receive_message(QueueUrl = QUEUE_URL, AttributeNames = ['SentTimestamp'],MaxNumberOfMessages = 1,MessageAttributeNames = ['All'],VisibilityTimeout=0,WaitTimeSeconds=0)
    MENSAGE_ID = PAYLOAD['Messages'][0]['MessageId']
    MENSAGE_BODY = PAYLOAD['Messages'][0]['Body']
    RECEIPT_HANDLE = PAYLOAD['Messages'][0]['ReceiptHandle']

    SQS.delete_message(
        QueueUrl=QUEUE_URL,
        ReceiptHandle=RECEIPT_HANDLE
    )

    print(f'''
    Received and deleted message  ( ͡° ͜ʖ ͡°)
    MensageID: {MENSAGE_ID}
    Body: 
    {MENSAGE_BODY}
    ''')
