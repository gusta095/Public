import requests
import json

SLACK_CHANNEL = "#slack-channel"
HOOK_URL = "https://hooks.slack.com/services/AAAAAAAAAAAA/BBBBBBBBBBBB/CCCCCCCCCCCCC"
MESSAGE = "test message !!"

def simple_send_mensage_slack():
    SLACK_NOTIFICATION = { 'channel': SLACK_CHANNEL, 'text': MESSAGE, 'attachments': [{"color": "#eed140" }] }
    REQUEST = requests.post(HOOK_URL, json.dumps(SLACK_NOTIFICATION))
    print(REQUEST)

def file_send_mensage_slack():
    FILE = open('teste.txt', 'r')
    FILE = FILE.read()
    SLACK_NOTIFICATION = { 'channel': SLACK_CHANNEL, 'text': FILE, 'attachments': [{"color": "#eed140"}] }
    REQUEST = requests.post(HOOK_URL, json.dumps(SLACK_NOTIFICATION))
    print(REQUEST)

