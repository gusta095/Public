import boto3
import json
import requests
import os
from urllib.request import urlopen, HTTPError, URLError

TOKEN = os.environ.get('TOKEN')
SLACK_CHANNEL = os.environ.get('SLACK_CHANNEL')
HOOK_URL = os.environ.get('HOOK_URL')
FILETYPE = os.environ.get('auto')
URL = os.environ.get('URL')
BUCKET_NAME = os.environ.get('BUCKET_NAME')

def lambda_handler(event, context): 
    for record in event['Records']:
        event_sns = record['Sns']['Message']
        json_file = json.loads(event_sns)
        bucket = json.dumps(json_file ["Records"][0]["s3"]["bucket"]["name"])
        path_file_json = json.dumps(json_file ["Records"][0]["s3"]["object"]["key"])
        datatime = json.dumps(json_file ["Records"][0]["eventTime"])
        path_file = path_file_json[1:48]
        file_name = path_file[29:80]

        print(f'''
        Bucket = {bucket}
        Path_file = {path_file}
        File_name = {file_name}
        Data = {datatime[0:10]}
        Hours = {datatime[11:19]}''')
    
    BUCKET_FILE_NAME = path_file
    LOCAL_FILE_NAME = '/tmp/%s' % file_name

    s3 = boto3.client('s3')
    s3.download_file(BUCKET_NAME, BUCKET_FILE_NAME, LOCAL_FILE_NAME)
    
    print('Arquivo baixado')
    print(BUCKET_FILE_NAME)
    print(LOCAL_FILE_NAME)
    print(BUCKET_NAME)

    with open(LOCAL_FILE_NAME ) as FILE:
        FILE_DATA = FILE.read()
    
    PAYLOAD = {
        "token": TOKEN,
        "channels": SLACK_CHANNEL,
        "content": FILE_DATA,
        "filename": BUCKET_FILE_NAME,
        "filetype": FILETYPE,
    }

    RESPONSE = requests.post(url = URL, data = PAYLOAD, headers={"Content-Type": "application/x-www-form-urlencoded"})
    if RESPONSE.status_code == 200:
        print('successfully completed upload file and status code %s' % RESPONSE.status_code)
    else:
        print('Failed to post file on slack channel and status code %s' % RESPONSE.status_code)