import boto3
import json
import requests
import os
import datetime
from urllib.request import urlopen, HTTPError, URLError
import time

inicio = time.time()

FULLTIME = datetime.datetime.now()
YEAR = FULLTIME.strftime('%Y')
MONTH = FULLTIME.strftime('%m')
DAY = FULLTIME.strftime('%d')

TOKEN = os.environ.get('TOKEN')
SLACK_CHANNEL = os.environ.get('SLACK_CHANNEL')
FILETYPE = os.environ.get('auto')
URL = os.environ.get('URL')
BUCKET_NAME = os.environ.get('BUCKET_NAME')

ARQUIVO_LIST = []

def lambda_handler(event, context):
    s3 = boto3.resource('s3')
    my_bucket = s3.Bucket(BUCKET_NAME)
    for file in my_bucket.objects.all():
        if (f'test/test-02/ARQUIVO_{YEAR}{MONTH}{DAY}') in file.key:
            ARQUIVO_FILE = file.key
            ARQUIVO_LIST.append(ARQUIVO_FILE)

    for ARQUIVO_COMPLETE_NAME in ARQUIVO_LIST:
        ARQUIVO_NAME = ARQUIVO_COMPLETE_NAME.strip('test/test-02/')
    
        BUCKET_FILE_NAME = ARQUIVO_COMPLETE_NAME
        LOCAL_FILE_NAME = (f'/home/user/{ARQUIVO_NAME}')

        s3 = boto3.client('s3')
        s3.download_file(BUCKET_NAME, BUCKET_FILE_NAME, LOCAL_FILE_NAME)
        print('foi baixado')
    
        with open(LOCAL_FILE_NAME ) as FILE:
            FILE_DATA = FILE.read()
    
        PAYLOAD = {
            "token": TOKEN,
            "channels": SLACK_CHANNEL,
            "content": FILE_DATA,
            "filename": BUCKET_FILE_NAME,
            "filetype": FILETYPE,
        }

        print(PAYLOAD)

        RESPONSE = requests.post(url = URL, data = PAYLOAD, headers={"Content-Type": "application/x-www-form-urlencoded"})
        if RESPONSE.status_code == 200:
            print('successfully completed upload file and status code %s' % RESPONSE.status_code)
        else:
            print('Failed to post file on slack channel and status code %s' % RESPONSE.status_code)

fim = time.time()
print(f'{(fim - inicio)/1000 :.3f} seconds')


