import requests
import boto3

TOKEN = "xoxb-AAAAAAAAAAA-BBBBBBBBBBB-CCCCCCCCCC"
CHANNELS = '#channels-name'
FILE_PATH = './teste.txt'
FILENAME = 'teste.txt'
FILETYPE = 'auto'

def send_file_slack_channel():
    URL = "https://slack.com/api/files.upload"

    with open(FILE_PATH) as FILE:
        FILE_DATA = FILE.read()
    
    PAYLOAD = {
        "token": TOKEN,
        "channels": CHANNELS,
        "content": FILE_DATA,
        "filename": FILENAME,
        "filetype": FILETYPE,
    }

    RESPONSE = requests.post(url = URL, data = PAYLOAD, headers={"Content-Type": "application/x-www-form-urlencoded"})
    if RESPONSE.status_code == 200:
        print(f'successfully completed upload file and status code {RESPONSE.status_code}')
    else:
        print(f'Failed to post file on slack channel and status code {RESPONSE.status_code}')

send_file_slack_channel()