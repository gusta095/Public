import requests
import json

request = requests.get('https://raw.githubusercontent.com/gusta095/Public/master/public.json')

json = json.loads(request.text)

print(json['users']['name'])