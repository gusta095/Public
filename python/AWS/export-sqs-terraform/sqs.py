import boto3
import json
import sys


OP = int(input(''''
Escolha o ambiente

(1) - testenv
(2) - msqa
(3) - msprod
(4) - sair

'''))

if OP == 1:
    AWS_PROFILE = 'testenv'
    ACCOUNT_ID = 'xxxxxxxxxxx'
elif OP == 2:
    AWS_PROFILE = 'microservices-qa'
    ACCOUNT_ID = 'xxxxxxxxxxx'
elif OP == 3:
    AWS_PROFILE = 'microservices-prod'
    ACCOUNT_ID = 'xxxxxxxxxxx'
elif OP == 4:
    sys.exit()
else:
    print('opção invalida')

REGION_NAME = 'us-east-1'

LIST_QUEUE_NAME_DLQ = []
LIST_QUEUE_NAME = []
LIST_QUEUE_FULL_NAME = []
LIST_QUEUE_NAME_FIFO = []

print('Executando ...')

def get_name_queue_shell():
    ACESSO_AWS = boto3.session.Session(profile_name=AWS_PROFILE)
    SQS = ACESSO_AWS.resource(service_name="sqs",region_name=REGION_NAME)
    QUEUES = SQS.queues.all()
    for q in QUEUES:
        QUEUE = q.url[41:200]
        if '.fifo' in QUEUE:
            X = QUEUE.replace(".fifo", "-fifo")
            print(X, file=open('queue-shell-fifo.txt', 'a'))
        else:
            print(QUEUE, file=open('queue-shell.txt', 'a'))

def get_name_queue():
    ACESSO_AWS = boto3.session.Session(profile_name=AWS_PROFILE)
    SQS = ACESSO_AWS.resource(service_name="sqs",region_name=REGION_NAME)
    QUEUES = SQS.queues.all()
    for q in QUEUES:
        QUEUE = q.url[41:200]
        if '.fifo' in QUEUE:
            LIST_QUEUE_NAME_FIFO.append(QUEUE)
        elif '-dlq' in QUEUE:
            LIST_QUEUE_NAME_DLQ.append(QUEUE)
            LIST_QUEUE_FULL_NAME.append(QUEUE)
        else:
            LIST_QUEUE_NAME.append(QUEUE)
            LIST_QUEUE_FULL_NAME.append(QUEUE)

def export_queue_comum():
    SQS = boto3.client('sqs')

    for NAME_QUEUE in LIST_QUEUE_NAME:
        QUEUE_ORIGEN = (f'https://sqs.us-east-1.amazonaws.com/{ACCOUNT_ID}/{NAME_QUEUE}')
        MESSAGE_QUEUE = SQS.get_queue_attributes(QueueUrl=QUEUE_ORIGEN,AttributeNames=['All'])

        TEST_DLQ = (MESSAGE_QUEUE["Attributes"])
        if 'RedrivePolicy' in TEST_DLQ and 'Policy' in TEST_DLQ:

            NAME = json.dumps(MESSAGE_QUEUE["Attributes"]["QueueArn"][35:300]).strip('"')
            VISIBILITY_TIMEOUT = json.dumps(MESSAGE_QUEUE["Attributes"]["VisibilityTimeout"]).strip('"')
            DELAY_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["DelaySeconds"]).strip('"')
            MESSAGE_RETENTION_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["MessageRetentionPeriod"]).strip('"')
            RECEIVE_MESSAGE_WAIT_TIME_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["ReceiveMessageWaitTimeSeconds"]).strip('"')
            DEAD_LETTER_TARGET_ARN = (f'arn:aws:sqs:us-east-1:{ACCOUNT_ID}:{NAME}-dlq')
            JSON_OBJECT = json.loads(MESSAGE_QUEUE["Attributes"]["Policy"])
            JSON_FORMATTED_STR = json.dumps(JSON_OBJECT, indent=2)

            print('''
resource "aws_sqs_queue" "%s" {
    name                        = "%s"
    visibility_timeout_seconds  = %s
    delay_seconds               = %s
    message_retention_seconds   = %s
    receive_wait_time_seconds   = %s
    redrive_policy = jsonencode({
        deadLetterTargetArn = "%s"
        maxReceiveCount     = 10
    })
    policy = <<POLICY
    %s
POLICY
}

            ''' % (NAME,NAME,VISIBILITY_TIMEOUT,DELAY_SECONDS,MESSAGE_RETENTION_SECONDS,RECEIVE_MESSAGE_WAIT_TIME_SECONDS,DEAD_LETTER_TARGET_ARN,JSON_FORMATTED_STR), file=open('main.tf', 'a'))

        elif 'RedrivePolicy' in TEST_DLQ:

            NAME = json.dumps(MESSAGE_QUEUE["Attributes"]["QueueArn"][35:300]).strip('"')
            VISIBILITY_TIMEOUT = json.dumps(MESSAGE_QUEUE["Attributes"]["VisibilityTimeout"]).strip('"')
            DELAY_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["DelaySeconds"]).strip('"')
            MESSAGE_RETENTION_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["MessageRetentionPeriod"]).strip('"')
            RECEIVE_MESSAGE_WAIT_TIME_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["ReceiveMessageWaitTimeSeconds"]).strip('"')
            DEAD_LETTER_TARGET_ARN = (f'arn:aws:sqs:us-east-1:{ACCOUNT_ID}:{NAME}-dlq')

            print('''
resource "aws_sqs_queue" "%s" {
    name                        = "%s"
    visibility_timeout_seconds  = %s
    delay_seconds               = %s
    message_retention_seconds   = %s
    receive_wait_time_seconds   = %s
    redrive_policy = jsonencode({
        deadLetterTargetArn = "%s"
        maxReceiveCount     = 10
    })
}
            ''' % (NAME,NAME,VISIBILITY_TIMEOUT,DELAY_SECONDS,MESSAGE_RETENTION_SECONDS,RECEIVE_MESSAGE_WAIT_TIME_SECONDS,DEAD_LETTER_TARGET_ARN), file=open('main.tf', 'a'))

        elif 'Policy' in TEST_DLQ:

            NAME = json.dumps(MESSAGE_QUEUE["Attributes"]["QueueArn"][35:300]).strip('"')
            VISIBILITY_TIMEOUT = json.dumps(MESSAGE_QUEUE["Attributes"]["VisibilityTimeout"]).strip('"')
            DELAY_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["DelaySeconds"]).strip('"')
            MESSAGE_RETENTION_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["MessageRetentionPeriod"]).strip('"')
            RECEIVE_MESSAGE_WAIT_TIME_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["ReceiveMessageWaitTimeSeconds"]).strip('"')
            JSON_OBJECT = json.loads(MESSAGE_QUEUE["Attributes"]["Policy"])
            JSON_FORMATTED_STR = json.dumps(JSON_OBJECT, indent=2)

            print('''
resource "aws_sqs_queue" "%s" {
    name                        = "%s"
    visibility_timeout_seconds  = %s
    delay_seconds               = %s
    message_retention_seconds   = %s
    receive_wait_time_seconds   = %s
    policy = <<POLICY
    %s
POLICY  
}
            ''' % (NAME,NAME,VISIBILITY_TIMEOUT,DELAY_SECONDS,MESSAGE_RETENTION_SECONDS,RECEIVE_MESSAGE_WAIT_TIME_SECONDS,JSON_FORMATTED_STR), file=open('main.tf', 'a'))

        else:
        
            NAME = json.dumps(MESSAGE_QUEUE["Attributes"]["QueueArn"][35:300]).strip('"')
            VISIBILITY_TIMEOUT = json.dumps(MESSAGE_QUEUE["Attributes"]["VisibilityTimeout"]).strip('"')
            DELAY_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["DelaySeconds"]).strip('"')
            MESSAGE_RETENTION_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["MessageRetentionPeriod"]).strip('"')
            RECEIVE_MESSAGE_WAIT_TIME_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["ReceiveMessageWaitTimeSeconds"]).strip('"')

            print('''
resource "aws_sqs_queue" "%s" {
    name                        = "%s"
    visibility_timeout_seconds  = %s
    delay_seconds               = %s
    message_retention_seconds   = %s
    receive_wait_time_seconds   = %s
}
            ''' % (NAME,NAME,VISIBILITY_TIMEOUT,DELAY_SECONDS,MESSAGE_RETENTION_SECONDS,RECEIVE_MESSAGE_WAIT_TIME_SECONDS), file=open('main.tf', 'a'))

def export_queue_dlq():
    SQS = boto3.client('sqs')

    for NAME_QUEUE in LIST_QUEUE_NAME_DLQ:
        QUEUE_ORIGEN = (f'https://sqs.us-east-1.amazonaws.com/{ACCOUNT_ID}/{NAME_QUEUE}')
        MESSAGE_QUEUE = SQS.get_queue_attributes(QueueUrl=QUEUE_ORIGEN,AttributeNames=['All'])
        
        NAME_DLQ = json.dumps(MESSAGE_QUEUE["Attributes"]["QueueArn"][35:300]).strip('"')
        VISIBILITY_TIMEOUT = json.dumps(MESSAGE_QUEUE["Attributes"]["VisibilityTimeout"]).strip('"')
        DELAY_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["DelaySeconds"]).strip('"')
        MESSAGE_RETENTION_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["MessageRetentionPeriod"]).strip('"')
        RECEIVE_MESSAGE_WAIT_TIME_SECONDS = json.dumps(MESSAGE_QUEUE["Attributes"]["ReceiveMessageWaitTimeSeconds"]).strip('"')

        print('''
resource "aws_sqs_queue" "%s" {
    name                        = "%s"
    visibility_timeout_seconds  = %s
    delay_seconds               = %s
    message_retention_seconds   = %s
    receive_wait_time_seconds   = %s
}
        ''' % (NAME_DLQ,NAME_DLQ,VISIBILITY_TIMEOUT,DELAY_SECONDS,MESSAGE_RETENTION_SECONDS,RECEIVE_MESSAGE_WAIT_TIME_SECONDS), file=open('main.tf', 'a'))

def export_output_queue():
    SQS = boto3.client('sqs')

    for NAME_QUEUE in LIST_QUEUE_FULL_NAME:
        QUEUE_ORIGEN = (f'https://sqs.us-east-1.amazonaws.com/{ACCOUNT_ID}/{NAME_QUEUE}')
        MESSAGE_QUEUE = SQS.get_queue_attributes(QueueUrl=QUEUE_ORIGEN,AttributeNames=['All'])
        
        NAME = json.dumps(MESSAGE_QUEUE["Attributes"]["QueueArn"][35:300]).strip('"')

        print('''
output "arn-%s" {
    value = "${aws_sqs_queue.%s.arn}"
}
        ''' % (NAME,NAME), file=open('outputs.tf', 'a'))


get_name_queue_shell()
get_name_queue()
export_queue_comum()
export_queue_dlq()
export_output_queue()