import boto3
import json
import sys

QUEUE_ORIGEN = str(sys.argv[1])
QUEUE_DESTINY = str(sys.argv[2])

def move_messages_between_queues_sqs():
    SQS = boto3.client('sqs')

    NUM_MESSAGE_QUEUE = SQS.get_queue_attributes(QueueUrl=QUEUE_ORIGEN,AttributeNames=['ApproximateNumberOfMessages'])
    CONT_MESSAGE = json.dumps(NUM_MESSAGE_QUEUE["Attributes"]["ApproximateNumberOfMessages"]).strip('"')
    CONT_MESSAGE_INT = int(CONT_MESSAGE)

    CONT = 1
    print(f'Transferencia de menssagem - MENSSAGENS: {CONT_MESSAGE_INT}')
    print(f'{QUEUE_ORIGEN} >>> {QUEUE_DESTINY}\n')
    while CONT < CONT_MESSAGE_INT+1:
        PAYLOAD_ORIGEM = SQS.receive_message(QueueUrl = QUEUE_ORIGEN, AttributeNames = ['SentTimestamp'],MaxNumberOfMessages = 1,MessageAttributeNames = ['All'],VisibilityTimeout=0,WaitTimeSeconds=0)
        MENSAGE_BODY = PAYLOAD_ORIGEM['Messages'][0]['Body']
        RECEIPT_HANDLE = PAYLOAD_ORIGEM['Messages'][0]['ReceiptHandle']

        SQS.delete_message(QueueUrl=QUEUE_ORIGEN,ReceiptHandle=RECEIPT_HANDLE)

        PAYLOAD_DESTINY = SQS.send_message(QueueUrl = QUEUE_DESTINY, DelaySeconds = 1, MessageBody = (MENSAGE_BODY))
        RESPONSE = PAYLOAD_DESTINY['MessageId']

        print(f'{CONT :0>2d}/{CONT_MESSAGE_INT} - {RESPONSE}')
        CONT += 1

move_messages_between_queues_sqs() 